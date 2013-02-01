CC := gcc
CFLAGS := -std=gnu99 -Wall -g
TARGET := olc

$(TARGET): lex.yy.o	
	$(CC) $(CFLAGS) lex.yy.o -o $(TARGET)

lex.yy.o:	lex.yy.c
	$(CC) $(CFLAGS) -c lex.yy.c

lex.yy.c:	olc_scanner.l
	flex olc_scanner.l

clean:
	rm -f *.o $(TARGET) core lex.yy.c
