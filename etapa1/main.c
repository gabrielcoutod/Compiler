 /* Made by Gabriel Couto Domingues */


int main(int argc, char** argv){

    initMe();
    
    while (isRunning()){
        int token = yylex();

        if (!isRunning())
            break;

        printf("(line=%d, str=%s, type=%d)\n", getLineNumber(), yytext, token);
    }

    printf("\n");

    hashPrint();

    hashFree();
}