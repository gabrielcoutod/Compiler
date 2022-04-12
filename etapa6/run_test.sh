# Made by Gabriel Couto Domingues 
# File for testing.
make clean
make

./etapa5 sample.txt out.txt > stdout.txt 2> stderr.txt
diff stdout.txt gold.txt

rm stdout.txt
rm stderr.txt
rm out.txt

make clean