#
# UFRGS - Compiladores B - Marcelo Johann - 2009/2
#

etapa6: main.o hash.o ast.o y.tab.o lex.yy.o decompiler.o semantic.o symbols.o tacs.o asm.o val_list.o
	gcc main.o lex.yy.o y.tab.o hash.o ast.o decompiler.o semantic.o symbols.o tacs.o asm.o val_list.o -o etapa6

main.o: main.c
	gcc -c main.c

decompiler.o: decompiler.c
	gcc -c decompiler.c

asm.o: asm.c
	gcc -c asm.c

val_list.o: val_list.c
	gcc -c val_list.c

semantic.o: semantic.c
	gcc -c semantic.c

symbols.o: symbols.c
	gcc -c symbols.c

tacs.o: tacs.c
	gcc -c tacs.c

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
	tar cvzf etapa6.tgz *

clean:
	rm lex.yy.c etapa6 y.tab.c y.tab.h *.o etapa6.tgz


