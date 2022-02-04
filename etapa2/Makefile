#
# UFRGS - Compiladores B - Marcelo Johann - 2009/2 - Etapa 1
#
# Makefile for single compiler call
# All source files must be included from code embedded in scanner.l
# In our case, you probably need #include "hash.c" at the beginning
# and #include "main.c" in the last part of the scanner.l
#

etapa2:  y.tab.c lex.yy.c
	gcc -o etapa2 lex.yy.c

 y.tab.c: parser.y
	bison -dy parser.y

lex.yy.c: scanner.l
	flex scanner.l 

tar:
	tar cvzf etapa2.tgz *

clean:
	rm lex.yy.c etapa2 y.tab.c y.tab.h etapa2.tgz


