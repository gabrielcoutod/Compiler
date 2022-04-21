# Made by Gabriel Couto Domingues 
# File for testing.
./compile.sh tests/operadores.txt tests/operadores
./tests/operadores.out > stdout.txt
diff tests/gold_operadores.txt stdout.txt
rm stdout.txt
rm ./tests/operadores.out


./compile.sh tests/fatorial.txt tests/fatorial
./tests/fatorial.out > stdout.txt
diff tests/gold_fatorial.txt stdout.txt
rm stdout.txt
rm ./tests/fatorial.out


./compile.sh tests/declaracoes.txt tests/declaracoes
./tests/declaracoes.out < tests/input_declaracoes.txt > stdout.txt
diff tests/gold_declaracoes.txt stdout.txt
rm stdout.txt
rm ./tests/declaracoes.out