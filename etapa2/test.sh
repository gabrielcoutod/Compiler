# Made by Gabriel Couto Domingues 
# File for testing.
# If the tests pass no output will be shown.
# If one of the tests fail diff will show the difference betweent the correct result and the program result.

print_result(){
    ./etapa2 $1 > output.txt 2> stderr.txt
    echo "$?: $(<stderr.txt)" >> out_all.txt
    rm output.txt
    rm stderr.txt
}

print_result tests/sample.txt
print_result tests/erro_10.txt
print_result tests/erro_108.txt  
print_result tests/erro_17.txt  
print_result tests/erro_22.txt  
print_result tests/erro_34.txt  
print_result tests/erro_5.txt  
print_result tests/erro_70.txt  
print_result tests/erro_83.txt  
print_result tests/erro_106.txt  
print_result tests/erro_23.txt   
print_result tests/erro_18.txt  
print_result tests/erro_30.txt
print_result tests/erro_6.txt  
print_result tests/erro_81.txt  
print_result tests/erro_9.txt
print_result tests/erro_109.txt  
print_result tests/erro_16.txt   
print_result tests/erro_21.txt  
print_result tests/erro_32.txt  
print_result tests/erro_49.txt  
print_result tests/erro_7.txt  
print_result tests/erro_8.txt   
print_result tests/erro_99.txt

diff out_all.txt gold.txt
rm out_all.txt