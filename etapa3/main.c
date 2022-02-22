 /* Made by Gabriel Couto Domingues */


int main(int argc, char** argv){

    initMe();

    if (argc < 2){
        printf("Missing input file\n");
        exit(1);
    }

    yyin = fopen(argv[1],"r");
    if (yyin == 0) {
        printf("Cannot open file %s... \n",argv[1]);
        exit(1);
    }

    yyparse();

    hashPrint();

    hashFree();

    fprintf(stderr, "Compilation Successful");

    exit(0);
}