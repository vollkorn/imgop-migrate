import json
import sys
import argparse

# arg 1 Pattern db json file
# arg 2 Serialized pattern
# arg 3 Pattern name


def print_usage():
    print ("pmerge <dbname>.db <pattern>.json patternname")

def query_yes_no(question, default="yes"):
    valid = {"yes": True, "y": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '%s'" % default)

    while True:
        sys.stdout.write(question + prompt)
        choice = raw_input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")

def write_db(db, filename, compress=False):
    fd = open(filename,"w")
    fd.seek(0)
    if not compress:
        json.dump(db, fd, indent=2, separators=(',', ': '), sort_keys=True)
    else:
        json.dump(db, fd, sort_keys=True)

    fd.close()

def get_db(filename):
    fd = open(filename, 'r')
    data = None    
    db = json.load(fd)
    if db is None:
       return (None, None) 
    if 'db' in db:
        data = db['db']        
    else:
        print("Could not find db object")
        return None
   
    fd.close()
    return (db, data)

def get_pattern(filename):
   fd = open(filename, 'r')
   obj = json.load(fd)
   fd.close()
   return obj


def list_db(filename):
    (db, data) = get_db(filename)
    if db is None:
        return

    if len(data) < 1:
        print ("Database is empty")
        return
    for i in xrange(0, len(data)):
        pattern = data[i]
        print str(i+1) + ": " + pattern['name']

def rm_from_db(filename):
    list_db(filename)
    sys.stdout.write("Index?:")
    index = raw_input().lower()
    if not index.isdigit():
        print("Index is not a number, abort.")
        return
    
    index = int(index)

    (db, data) = get_db(filename)
    i = index-1
    if i >= 0 and i < len(data):
        del data[i]
    else:
        print ("Could not delete pattern at index " + str(index))
    write_db(db, filename)

def new_db(filename):
    if(query_yes_no("Create new database?")):
       db = json.loads('{"db": []}')    
       write_db(db, filename)

def compress(filename):
    (db, data) = get_db(filename)
    write_db(db, filename, True)

def beautify(filename):
    (db, data) = get_db(filename)
    write_db(db, filename, False)

def add_to_db(dbfilename, patternfilename, preserve_hwiface = True ):
    print "Merging pattern into db: " + patternfilename 

    (db, data) = get_db(dbfilename)
    patternobj = get_pattern(patternfilename)
    replace = False
    dbpattern = None
    for pattern in data:
        if(pattern['name'] == patternobj['name']):
            print("Pattern '" +  patternobj['name'] + "' already exists!")
            dbpattern = pattern
            replace = query_yes_no("Replace pattern?")
            if not replace:
                return
    
    if replace:
        hwfaceobj = None
        if preserve_hwiface:
            hwifaceobj = dbpattern['attributes']['hw_interface']
            patternobj['attributes']['hw_interface'] = hwifaceobj
            #if not hwifaceobj is None:
            #json.dumps(hwifaceobj, sort_keys=True, indent=4, separators=(',', ': '))
        det = lambda patterobj, p: (patternobj['name'] == p['name'])
        data[:] = [p for p in data if not det]

    data.append(patternobj)
    write_db(db, dbfilename)
    print ("done")

def main():
    
    parser = argparse.ArgumentParser(description='Query/manipulate pattern database.')
    parser.add_argument('action', choices=['beautify','compress', 'new', 'add', 'list', 'rm'])
    parser.add_argument('dbfilename', type=str)
    parser.add_argument('patternfilename', nargs='*', type=str)
    
    args = None
    try:
        args = parser.parse_args()
    except IOError, msg:
        parser.error(str(msg))
        exit(1)

    if args.action == 'list':
        list_db(args.dbfilename)
    elif args.action == 'rm':
        rm_from_db(args.dbfilename)
    elif args.action == 'add':
    	patternfilenames = args.patternfilename    	
    	for f in patternfilenames:    	
        	add_to_db(args.dbfilename, f)
    elif args.action == 'new':
        new_db(args.dbfilename)
    elif args.action == 'compress':
        compress(args.dbfilename)
    elif args.action == 'beautify':
        beautify(args.dbfilename)
   
if __name__ == "__main__":
    main()
