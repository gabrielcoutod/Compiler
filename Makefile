#
# UFRGS - Compiladores B - Marcelo Johann - 2009/2
#

compiler: obj/main.o obj/hash.o obj/ast.o obj/y.tab.o obj/lex.yy.o obj/decompiler.o obj/semantic.o obj/symbols.o obj/tacs.o obj/asm.o obj/val_list.o
	gcc obj/main.o obj/lex.yy.o obj/y.tab.o obj/hash.o obj/ast.o obj/decompiler.o obj/semantic.o obj/symbols.o obj/tacs.o obj/asm.o obj/val_list.o -o compiler

obj/main.o: obj src/main.c
	gcc -c src/main.c -o obj/main.o -Iinclude

obj/decompiler.o: obj src/decompiler.c
	gcc -c src/decompiler.c -o obj/decompiler.o -Iinclude

obj/asm.o: obj src/asm.c
	gcc -c src/asm.c -o obj/asm.o -Iinclude

obj/val_list.o: obj src/val_list.c
	gcc -c src/val_list.c -o obj/val_list.o -Iinclude

obj/semantic.o: src/semantic.c
	gcc -c src/semantic.c -o obj/semantic.o -Iinclude

obj/symbols.o: obj src/symbols.c
	gcc -c src/symbols.c -o obj/symbols.o -Iinclude

obj/tacs.o: obj src/tacs.c
	gcc -c src/tacs.c -o obj/tacs.o -Iinclude

obj/hash.o: obj src/hash.c
	gcc -c src/hash.c -o obj/hash.o -Iinclude

obj/ast.o: obj src/ast.c
	gcc -c src/ast.c -o obj/ast.o -Iinclude

obj/y.tab.o: obj src/y.tab.c
	gcc -c src/y.tab.c -o obj/y.tab.o -Iinclude

obj/lex.yy.o: obj src/lex.yy.c src/y.tab.c
	gcc -c src/lex.yy.c -o obj/lex.yy.o -Iinclude

src/y.tab.c: src/parser.y
	bison -dy src/parser.y -b src/y --warnings=none

src/lex.yy.c: src/scanner.l
	flex -o src/lex.yy.c src/scanner.l 

obj:
	mkdir obj

clean:
	rm src/lex.yy.c src/y.tab.c src/y.tab.h obj compiler -r


