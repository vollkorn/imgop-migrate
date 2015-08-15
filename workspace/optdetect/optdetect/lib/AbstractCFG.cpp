/*
 * AbstractCFG.cpp
 *
 *  Created on: Jul 28, 2015
 *      Author: lukas
 */

#include "AbstractCFG.h"

using optmig::AbstractCFG;
using optmig::AbstractCFGNode;

void AbstractCFGNode::print(raw_ostream &O) const {

  O << get_uid();
  if (!Labels.empty()) {
    std::string lbl;
    lbl += " [";
    for (auto label : Labels)
      lbl += to_string(label) + ", ";

    lbl.erase(lbl.end() - 2, lbl.end());
    lbl += "]";
    O << lbl;
  }
  if (BB)
    O << " @ " << BB->getName();
}

AbstractCFGNode *AbstractCFG::get_node(BasicBlock *BB) {

  if (NodeBBmap.find(BB) != NodeBBmap.end())
    return NodeBBmap[BB];
  return nullptr;
}

AbstractCFGNode *AbstractCFG::get_node(u_int64_t _id) {
  iterator iter = std::find_if(Nodes.begin(), Nodes.end(), [&](AbstractCFGNode *N) { return N->get_uid() == _id; });

  return *iter;
}

const AbstractCFG *AbstractCFG::deserialize(Function *F, std::ifstream &is, ScalarEvolution *SE) {
  const AbstractCFG *H = nullptr;

  if (is.is_open()) {
    json v = json::parse(is);
    H = _deserialize(F, v, SE);
    is.close();
  }
  return H;
}

const AbstractCFG *AbstractCFG::createAbstractCFG(Function *F, LoopInfo &LI, ScalarEvolution &SE, DominatorTree &DT) {

  AbstractCFG *T = new AbstractCFG(F);

  BasicBlock *entry = &F->getEntryBlock();

  std::set<BasicBlock *> visited;

  bool loops_normalized = true;
  for (LoopInfo::iterator LB = LI.begin(), LE = LI.end(); LB != LE; ++LB) {
    Loop *L = *LB;
    if (!L->isLoopSimplifyForm() || !L->isLCSSAForm(DT)) {
      loops_normalized &= false;
      dbgs() << "Loops not normalized!\n";
    }
    SmallVector<BasicBlock *, 8> ExitBlocks;
    L->getExitBlocks(ExitBlocks);
    if (ExitBlocks.size() > 1) {
      dbgs() << "Control flow not supported!\n";
      loops_normalized &= false;
    }
  }

  if (!loops_normalized)
    return nullptr;

  recursiveTraverse(T, entry, nullptr, visited, &LI, &SE);

  return T;
}

const AbstractCFG *AbstractCFG::_deserialize(Function *F, const json &Pattern, ScalarEvolution *SE) {

  std::map<unsigned, AbstractCFGNode *> id_node_map;

  AbstractCFG *G = new AbstractCFG(F);

  json graph = Pattern["graph"];
  json nodes = graph[0]["nodes"];
  json edges = graph[1]["edges"];

  std::map<u_int64_t, ExpressionNode*> lazyReference;

  for (auto it = nodes.begin_elements(); it != nodes.end_elements(); ++it) {
    unsigned _id = (*it)["_id"].as_uint();

    json attributes = (*it)["attributes"];
    AbstractCFGNode *N = nullptr;
    Expression *AT = nullptr, *BT = nullptr;
    BasicBlock *BB = BasicBlock::Create(F->getContext(), "blk_" + utostr_32(_id), F, nullptr);
    std::vector<AbstractCFGNode::Label> labels;
    std::vector<Expression *> expressions;
    if (!attributes.is_empty()) {

      if (attributes.has_member("labels")) {
        std::vector<unsigned> parsed_labels = attributes["labels"].as_vector<unsigned>();

        std::for_each(parsed_labels.begin(), parsed_labels.end(),
                      [&](unsigned lbl) { labels.push_back(static_cast<AbstractCFGNode::Label>(lbl)); });
      }

      if (attributes.has_member("expressions")) {
        json e = attributes["expressions"];
        for (auto eit = e.begin_elements(), eend = e.end_elements(); eit != eend; ++eit) {
          Expression* expression = Expression::deserialize(BB, *eit, SE, lazyReference);
          if (expression != nullptr)
            expressions.push_back(expression);
        }
      }
    }

    N = new AbstractCFGNode(labels, BB);
    if (N) {
      N->add_expression(expressions);
      id_node_map.insert(std::make_pair(_id, N));
      G->add_node(N);
    }
  }

  for(auto it = lazyReference.begin(), end = lazyReference.end(); it != end; ++it){

	  u_int64_t id = (*it).first;
	  ExpressionNode* n = (*it).second;

	  n->Reference = id_node_map[id];

  }
  for (auto it = edges.begin_elements(); it != edges.end_elements(); ++it) {

    unsigned src_id = (*it)["src"].as_uint();
    unsigned dst_id = (*it)["dst"].as_uint();
    AbstractCFGNode *&src = id_node_map[src_id];
    AbstractCFGNode *&dst = id_node_map[dst_id];

    src->add_child(dst);
  }
  return G;
}

bool AbstractCFG::recursiveTraverse(AbstractCFG *T, BasicBlock *BB, AbstractCFGNode *parent,
                                    std::set<BasicBlock *> &visited, LoopInfo *LI, ScalarEvolution *SE) {
  static unsigned UID = 0;
  auto col = visited.insert(BB);

  LLVMContext &context = BB->getContext();

  if (!col.second) {
    parent->add_child(T->get_node(BB));
    return true;
  }

  TerminatorInst *term = BB->getTerminator();

  std::vector<AbstractCFGNode::Label> Labels;

  if (parent == nullptr)
    Labels.push_back(AbstractCFGNode::ENTRY);
  // Categorize BBs according to their role in the CFG
  else if (term->getNumSuccessors() > 0) {

    // Check if block is pre-header for a loop
    if (term->getNumSuccessors() == 1) {
      BasicBlock *successor = term->getSuccessor(0);
      if (Loop *L = LI->getLoopFor(successor))
        if (BB == L->getLoopPreheader())
          Labels.push_back(AbstractCFGNode::LOOP_PRE_HEADER);
    }

    if (BasicBlock *predecessor = BB->getSinglePredecessor()) {
      if (Loop *L = LI->getLoopFor(predecessor))
        if (BB == L->getExitBlock())
          Labels.push_back(AbstractCFGNode::LOOP_EXIT);
    }

    // Check if BB is loop related
    if (Loop *L = LI->getLoopFor(BB)) { // innermost loop
      // categorize role of BB in loop
      if (L->getHeader() == BB)
        // I some circumstances loop header is equal to loop body
        Labels.push_back(AbstractCFGNode::LOOP_HEADER);

      if (L->getLoopLatch() == BB)
        Labels.push_back(AbstractCFGNode::LOOP_INC);

      // anything remaining is a loop body
      Labels.push_back(AbstractCFGNode::LOOP_BODY);
    }

  } else // BBs without successor are exit blocks
    Labels.push_back(AbstractCFGNode::EXIT);

  AbstractCFGNode *node = new AbstractCFGNode(Labels, BB);

  node->add_expression(Expression::calculateAssignmentExpression(BB, SE, LI));
  node->add_expression(Expression::calculateBranchExpression(BB, SE, LI));

  T->add_node(node);
  if (parent)
    parent->add_child(node);

  for (succ_iterator IB = succ_begin(BB), IE = succ_end(BB); IB != IE; ++IB)
    if (!recursiveTraverse(T, *IB, node, visited, LI, SE))
      return false;

  return true;
}
