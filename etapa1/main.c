 /* Feito por Gabriel Couto Domingues */

// Main baseada na main em http://www.inf.ufrgs.br/~johann/comp/main.c
int main(int argc, char** argv){

    initMe();
    
    while (isRunning()){
        int token = yylex();

        if (!isRunning())
            break;

        printf("(line=%d, str=%s, type=%d)\n", getLineNumber(), yytext, token);
    }

    hashPrint();

    hashFree();
}