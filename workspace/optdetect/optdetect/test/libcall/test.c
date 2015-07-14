/*
 * test.c
 *
 *  Created on: Jun 23, 2015
 *      Author: lukas
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <sys/mman.h>
#include <dlfcn.h>
#include <link.h>
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>


int main(int argc, char **argv) {

  const char *filename = "/home/lukas/uni/master/MasterArbeit/workspace/optdetect/optdetect/test/libcall/testlibfcn.so";
//  const char *filename = "testlibfcn.so";
  const char *shmregion = "foobar2";
  char *error;
  int (*addfcn)(int, int);
  const size_t region_size = sysconf(_SC_PAGE_SIZE);

  size_t mapped_page_size = region_size;


  char *mmapped;
  struct stat st;

  if (stat(filename, &st) < 0){
    printf("Could stat file %s!\n", filename);
    return 1;
  }
  size_t nbytes = st.st_size;

  char data[nbytes];

  while(mapped_page_size < nbytes)
	  mapped_page_size += region_size;

  // load object file into memory
  int fd = open(filename, O_RDONLY);
  if (fd < 0){
    printf("Could read shared library\n");
    return 1;
  }
  read(fd, &data[0], nbytes);
  close(fd);

  int shm = shm_open(shmregion, O_CREAT | O_RDWR, S_IRUSR | S_IWUSR);
  if (shm < 0){
	printf("Error opening shared memory region! %s\n", strerror(errno));
    /* Handle error */
    return 1;
  }

  ftruncate(shm, mapped_page_size);

  // mmap obj as executable
  mmapped = (char *)mmap(NULL, mapped_page_size, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_SHARED, shm, 0);

  memcpy(mmapped, &data[0], nbytes);

  // dlopen

  char fd_str[15];
  char *fd_str_full = (char*) calloc(1024, sizeof(char));
  char buf[1024];
  sprintf(fd_str, "%d", shm);
  strcat(fd_str_full, "/proc/self/fd/");
  strcat(fd_str_full, fd_str);

  readlink(fd_str_full, &buf[0], 1024);
  printf("Shm filename %s\n", fd_str_full);


  void *dlhandle = dlopen(fd_str_full, RTLD_LAZY);
//  void *dlhandle = dlopen(filename, RTLD_LAZY);

  if (!dlhandle) {
	error = dlerror();
    free(fd_str_full);
    printf("Could not load shared library! %s\n", error);
    munmap(mmapped, mapped_page_size);
    shm_unlink(shmregion);
    return 1;
  }
  free(fd_str_full);

  // get symbol
  addfcn = dlsym(dlhandle, "add");
  if ((error = dlerror()) != NULL) {
    printf("Could not find function: %s \n", error);
    dlclose(dlhandle);
    munmap(mmapped, mapped_page_size);
    shm_unlink(shmregion);
    return 1;
  }
  // execute

  printf("3 + 7 : %d\n", (*addfcn)(3, 7));

  // cleanup
  dlclose(dlhandle);
  munmap(mmapped, mapped_page_size);
  shm_unlink(shmregion);

  return 0;
}
