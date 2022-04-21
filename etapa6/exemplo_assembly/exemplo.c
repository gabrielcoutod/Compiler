#include<stdio.h>

int int_um = 1;
int int_dois = 2;
int int_res = 50;
int um_bool = 'a';
char *uma_string = "uma string";
int um_vec[3] = {97,2,0};

void sum(){
    int_res = int_um+int_dois;
}

void sub(){
    int_res = int_um-int_dois;
}

void div(){
    int_res = int_um/int_dois;
}

void mul(){
    int_res = int_um*int_dois;
}

void not_equal(){
    int_res = int_um!=int_dois;
}

void equal(){
    int_res = int_um==int_dois;
}

void great_or_equal(){
    int_res = int_um>=int_dois;
}

void less_or_equal(){
    int_res = int_um<=int_dois;
}

void great(){
    int_res = int_um>int_dois;
}

void less(){
    int_res = int_um<int_dois;
}

void copy(){
    int_res = int_um;
}

void jfalse(){
    if(um_bool == 1){
        int_res = int_um;
    }
}

void jump(){
    um_label:
    goto um_label;
}


void copy_vec(){
    um_vec[int_um] = int_dois;
}

void acc_vec(){
    int_res = um_vec[int_um];
}

void print_str(){
    printf("%s",uma_string);
}

void print_int(){
    printf("%d",int_um);
}

int um_return(){
    return int_res;
}

void call(){
    int_res = um_return();
}

void read(){
    scanf("%d", &int_res);
}



int main(){
    printf("%s", uma_string);
    int_um = int_um / int_dois;
    int_um = um_vec[um_bool];
    um_bool = int_um < int_um;
    um_vec[um_bool] = int_res;
    if(um_bool == 1){
        int_dois = 5;
    }
    scanf("%d", &int_um);
    printf("%s","uma string na main");
    printf("%d",int_um);
}