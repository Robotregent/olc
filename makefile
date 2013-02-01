CC := gcc
CFLAGS := -std=gnu99 -Wall -g
TARGET := olc

$(TARGET):	y.tab.o lex.yy.o	
	$(CC) $(CFLAGS) y.tab.o lex.yy.o -o $(TARGET) -lm

y.tab.o:	y.tab.c y.tab.h 
	$(CC) $(CFLAGS) -c y.tab.c

lex.yy.o:	lex.yy.c y.tab.h
	$(CC) $(CFLAGS) -c lex.yy.c

y.tab.c:	olc_parser.y
	yacc -d olc_parser.y

lex.yy.c:	olc_scanner.l
	lex olc_scanner.l

clean:
	rm -f *.o $(TARGET) core lex.yy.c y.tab.*
