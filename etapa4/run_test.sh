# Made by Gabriel Couto Domingues 
# File for testing.

print_result(){
    ./etapa4 $1 $2 > output.txt 2> stderr.txt
    echo "$?: $1: $(<stderr.txt)" >> out_all.txt
    rm output.txt
    rm stderr.txt
}

make clean
make

print_result tests/sample.txt copy.txt

print_result tests/erro_10.txt copy.txt
print_result tests/erro_108.txt copy.txt
print_result tests/erro_17.txt  copy.txt  
print_result tests/erro_22.txt  copy.txt
print_result tests/erro_34.txt  copy.txt
print_result tests/erro_5.txt  copy.txt
print_result tests/erro_70.txt  copy.txt
print_result tests/erro_83.txt  copy.txt
print_result tests/erro_106.txt  copy.txt
print_result tests/erro_23.txt   copy.txt
print_result tests/erro_18.txt  copy.txt
print_result tests/erro_30.txt copy.txt
print_result tests/erro_6.txt  copy.txt
print_result tests/erro_81.txt  copy.txt
print_result tests/erro_9.txt copy.txt
print_result tests/erro_109.txt  copy.txt
print_result tests/erro_16.txt copy.txt
print_result tests/erro_21.txt  copy.txt
print_result tests/erro_32.txt  copy.txt
print_result tests/erro_49.txt  copy.txt
print_result tests/erro_7.txt  copy.txt
print_result tests/erro_8.txt copy.txt   
print_result tests/erro_99.txt copy.txt

print_result tests/nao_existe.txt copy.txt
print_result tests/nao_existe1.txt copy.txt
print_result tests/nao_existe2.txt copy.txt

print_result
print_result arquivo.txt



print_result tests/sem_10.txt copy.txt
print_result tests/sem_118_1.txt copy.txt
print_result tests/sem_118_2.txt copy.txt
print_result tests/sem_118_3.txt copy.txt
print_result tests/sem_119_1.txt copy.txt
print_result tests/sem_119_2.txt copy.txt
print_result tests/sem_119_3.txt copy.txt
print_result tests/sem_12.txt copy.txt
print_result tests/sem_13.txt copy.txt
print_result tests/sem_14.txt copy.txt
print_result tests/sem_15.txt copy.txt
print_result tests/sem_17.txt copy.txt
print_result tests/sem_23.txt copy.txt
print_result tests/sem_25.txt copy.txt
print_result tests/sem_26_1.txt copy.txt
print_result tests/sem_26_10.txt copy.txt
print_result tests/sem_26_11.txt copy.txt
print_result tests/sem_26_12.txt copy.txt
print_result tests/sem_26_13.txt copy.txt
print_result tests/sem_26_14.txt copy.txt
print_result tests/sem_26_15.txt copy.txt
print_result tests/sem_26_16.txt copy.txt
print_result tests/sem_26_17.txt copy.txt
print_result tests/sem_26_18.txt copy.txt
print_result tests/sem_26_19.txt copy.txt
print_result tests/sem_26_2.txt copy.txt
print_result tests/sem_26_20.txt copy.txt
print_result tests/sem_26_3.txt copy.txt
print_result tests/sem_26_4.txt copy.txt
print_result tests/sem_26_5.txt copy.txt
print_result tests/sem_26_6.txt copy.txt
print_result tests/sem_26_7.txt copy.txt
print_result tests/sem_26_8.txt copy.txt
print_result tests/sem_26_9.txt copy.txt
print_result tests/sem_28_1.txt copy.txt
print_result tests/sem_28_2.txt copy.txt
print_result tests/sem_28_3.txt copy.txt
print_result tests/sem_29_1.txt copy.txt
print_result tests/sem_29_2.txt copy.txt
print_result tests/sem_31_1.txt copy.txt
print_result tests/sem_31_2.txt copy.txt
print_result tests/sem_31_3.txt copy.txt
print_result tests/sem_31_4.txt copy.txt
print_result tests/sem_33_1.txt copy.txt
print_result tests/sem_33_2.txt copy.txt
print_result tests/sem_35.txt copy.txt
print_result tests/sem_4.txt copy.txt
print_result tests/sem_40_1.txt copy.txt
print_result tests/sem_40_2.txt copy.txt
print_result tests/sem_40_3.txt copy.txt
print_result tests/sem_40_4.txt copy.txt
print_result tests/sem_50.txt copy.txt
print_result tests/sem_52.txt copy.txt
print_result tests/sem_53.txt copy.txt
print_result tests/sem_58.txt copy.txt
print_result tests/sem_6.txt copy.txt
print_result tests/sem_65.txt copy.txt
print_result tests/sem_74.txt copy.txt
print_result tests/sem_8.txt copy.txt
print_result tests/sem_82.txt copy.txt
print_result tests/sem_84.txt copy.txt
print_result tests/sem_92.txt copy.txt
print_result tests/sem_7.txt copy.txt
print_result tests/sem_15_2.txt copy.txt
print_result tests/sem_110.txt copy.txt
print_result tests/sem_72.txt copy.txt
print_result tests/sem_109.txt copy.txt

diff out_all.txt gold.txt
rm copy.txt
rm out_all.txt

make clean