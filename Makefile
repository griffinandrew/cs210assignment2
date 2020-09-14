.PHONY: all clean test gitlog

all: assignment-2

assignment-2: assignment-2.c
	${CC} -std=c99 -g assignment-2.c -o assignment-2
	
test: assignment-2 gitlog
	./test.sh

gitlog:
	git log -p > gitlog.txt
	
clean:
	-${RM} assignment-2