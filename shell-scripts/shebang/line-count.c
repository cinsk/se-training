#include <stdio.h>
#include <string.h>

#include <errno.h>

#ifndef LINE_MAX
# define LINE_MAX        256
#endif

int
main(int argc, char *argv[])
{
  FILE *fp;
  char buf[LINE_MAX];
  unsigned long count = 0;

  if (argc != 2) {
    fprintf(stderr, "argument(s) required\n");
    return 1;
  }

  fp = fopen(argv[1], "r");
  if (fp == NULL) {
    fprintf(stderr, "cannot open %s: %s\n", argv[1], strerror(errno));
    return 1;
  }

  while (fgets(buf, LINE_MAX, fp) != NULL) {
    count++;
  }
  fclose(fp);
  fprintf(stderr, "%lu\n", count);

  return 0;
}
