print_result(){
    ./etapa2 $1 > output.txt 2> stderr.txt
    echo "$?: $(<stderr.txt)"
    rm output.txt
    rm stderr.txt
}

print_result sample.txt
print_result intercalando_declaracoes.txt
