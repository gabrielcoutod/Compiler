# Made by Gabriel Couto Domingues 
# File for testing.
make clean
make

./etapa6 sample.txt out.txt > stdout.txt 2> stderr.txt
gcc out.s
./a.out

rm stdout.txt
rm stderr.txt
rm out.txt
rm out.s
rm a.out

make clean