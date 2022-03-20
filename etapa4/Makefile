#
# UFRGS - Compiladores B - Marcelo Johann - 2009/2 - Etapa 1
#
# Makefile for single compiler call
# All source files must be included from code embedded in scanner.l
# In our case, you probably need #include "hash.c" at the beginning
# and #include "main.c" in the last part of the scanner.l
#

etapa4: main.o hash.o ast.o y.tab.o lex.yy.o decompiler.o semantic.o symbols.o
	gcc main.o lex.yy.o y.tab.o hash.o ast.o decompiler.o semantic.o symbols.o -o etapa4

main.o: main.c
	gcc -c main.c

decompiler.o: decompiler.c
	gcc -c decompiler.c

semantic.o: semantic.c
	gcc -c semantic.c

symbols.o: symbols.c
	gcc -c symbols.c

hash.o: hash.c
	gcc -c hash.c

ast.o: ast.c
	gcc -c ast.c

y.tab.o: y.tab.c
	gcc -c y.tab.c

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

y.tab.c: parser.y
	bison -dy parser.y

lex.yy.c: scanner.l
	flex scanner.l 

tar:
	tar cvzf etapa4.tgz *

clean:
	rm lex.yy.c etapa4 y.tab.c y.tab.h *.o etapa4.tgz


