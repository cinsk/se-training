

CFLAGS = -Wall
.PHONY: all clean

all: args line-count line-count.sh args.sh
rebuild: clean all

args: args.o
	$(CC) $(CFLAGS) -o args args.c

line-count: line-count.o
	$(CC) $(CFLAGS) -o line-count line-count.c

args.sh:
	echo "#!$$(pwd)/args -f hello there" > args.sh
	chmod +x args.sh

line-count.sh:
	echo "#!$$(pwd)/line-count" > line-count.sh
	echo "hello there" >> line-count.sh
	echo "greetings" >> line-count.sh
	chmod +x line-count.sh

clean:
	rm -f args.o line-count.o
	rm -f args line-count args.sh line-count.sh
