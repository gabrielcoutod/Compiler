

%token KW_CHAR
%token KW_INT 
%token KW_FLOAT          

%token KW_IF             
%token KW_THEN           
%token KW_ELSE           
%token KW_WHILE          
%token KW_GOTO           
%token KW_READ           
%token KW_PRINT          
%token KW_RETURN         

%token OPERATOR_LE       
%token OPERATOR_GE       
%token OPERATOR_EQ       
%token OPERATOR_DIF      

%token TK_IDENTIFIER     

%token LIT_INTEGER       
%token LIT_CHAR          
%token LIT_STRING        

%token TOKEN_ERROR

%{
int yyerror();
%}


%%

programa: decl
    ;

decl: dec decl
    |
    ;

dec: decv ';'
    | decf
    ;

decv: var
    | array
    ; 

var: type TK_IDENTIFIER ':' initval
    ;  

initval: LIT_INTEGER
    | LIT_CHAR
    | LIT_INTEGER '/' LIT_INTEGER
    ;

array: type TK_IDENTIFIER '[' LIT_INTEGER ']' ':' litl
    | type TK_IDENTIFIER '[' LIT_INTEGER ']'
    ;

litl: lit litl
    | lit
    ;

lit: LIT_INTEGER
    | LIT_CHAR
    ;

type: KW_INT
    | KW_CHAR
    | KW_FLOAT
    ;


decf: type TK_IDENTIFIER '(' parl ')' cmd
    ;

parl: par restoparl
    |
    ;

restoparl: ',' par restoparl
    |
    ;

par: type TK_IDENTIFIER
    ;

body: '{' cmdl '}'
    ;

cmdl: cmd ';' cmdl
    | rot  ':' cmdl
    | cmd
    | rot
    ;

cmd: attr
    | control
    | print
    | return
    | body
    |
    ;

attr: TK_IDENTIFIER '=' expr
    | TK_IDENTIFIER '[' expr ']' '=' expr
    ;

print: KW_PRINT printl
    ;

printl: expr ',' printl
    | LIT_STRING ',' printl
    | expr
    | LIT_STRING
    ;

return: KW_RETURN expr
    ;

expr: TK_IDENTIFIER 
    | TK_IDENTIFIER '[' expr ']'
    | lit
    | '(' expr ')'
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    | expr '<' expr
    | expr '>' expr
    | expr OPERATOR_LE expr
    | expr OPERATOR_GE expr
    | expr OPERATOR_EQ expr
    | expr OPERATOR_DIF expr
    | fcall
    | KW_READ
    ;

fcall: TK_IDENTIFIER '(' argl ')'
    ;

argl: expr restoargl
    |   
    ;

restoargl: ',' expr restoargl
    |
    ;

control: KW_IF expr KW_THEN cmd
    | KW_IF expr KW_THEN cmd KW_ELSE cmd
    | KW_WHILE expr cmd
    | KW_GOTO rot
    ;

rot: TK_IDENTIFIER
    ;

%%

int yyerror(){
    fprintf(stderr, "Syntax error at line %d.\n", getLineNumber());
    exit(3);
}