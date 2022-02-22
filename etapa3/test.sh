./etapa3 sample.txt out1.txt 2> stderr.txt
./etapa3 out1.txt out2.txt 2> stderr.txt
diff out1.txt out2.txt
rm out1.txt out2.txt stderr.txt