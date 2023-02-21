CC = gcc
DEBUG = -g

CFLAGS = $(DEBUG) -Wall -Wshadow -Wunreachable-code -Wredundant-decls\
		-Wmissing-declarations -Wold-style-definition -Wmissing-prototypes\
		-Wdeclaration-after-statement -Wno-return-local-addr\
		-Wuninitialized -Wextra -Wunused\

PROG = psush

all: $(PROG)


$(PROG): $(PROG).o
	$(CC) $(CFLAGS) $< -o $(PROG)

psush.o: psush.c psush.h
	$(CC) $(CFLAGS) -c psush.c

opt: clean
	make DEBUG=-O3

tar: clean
	tar cvfz $(PROG).tar.gz *.[ch] ?akefile

# clean up the compiled files and editor chaff
clean cls:
	rm -f $(PROG) *.o *~ \#* *.out *.err *.nfs* file*.txt *_cmp
