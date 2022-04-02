# Made by Gabriel Couto Domingues 
# File for testing.
make clean
make

./etapa5 sample.txt out.txt > output.txt 2> stderr.txt
diff stderr.txt gold.txt

rm output.txt
rm out.txt
rm stderr.txt

make clean