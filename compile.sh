make
./compiler $1 out.txt
mv out.s "$2.s"
gcc "$2.s" -o "$2.out"
rm out.txt
make clean