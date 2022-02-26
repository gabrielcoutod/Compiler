 /* Made by Gabriel Couto Domingues */

 %{
    #include "ast.h"
    #include "hash.h"

    int yyerror();
    int getLineNumber();
    int yylex();

    AST *ast;
 %}

 %union {
    HASH *symbol;
    AST *ast;
 }

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

%token<symbol> TK_IDENTIFIER     

%token<symbol> LIT_INTEGER       
%token<symbol> LIT_CHAR          
%token<symbol> LIT_STRING        

%token TOKEN_ERROR

%type<ast> rot
%type<ast> control
%type<ast> restoargl
%type<ast> argl
%type<ast> fcall
%type<ast> expr
%type<ast> return
%type<ast> printl
%type<ast> print
%type<ast> attr
%type<ast> cmd
%type<ast> cmdl
%type<ast> body
%type<ast> par
%type<ast> restoparl
%type<ast> parl
%type<ast> decf
%type<ast> floattype
%type<ast> inttype
%type<ast> litl
%type<ast> array
%type<ast> lit
%type<ast> var
%type<ast> decv
%type<ast> dec
%type<ast> decl
%type<ast> programa

%left '<' '>' OPERATOR_LE OPERATOR_GE OPERATOR_EQ OPERATOR_DIF
%left '+' '-'
%left '*' '/'

%right IF KW_ELSE


%{
int yyerror();
%}


%%

programa: decl {ast = $$ = $1;}
    ;

decl: dec decl {$$ = astCreate(AST_DECL, 0, $1, $2, 0, 0);}
    | {$$ = 0;}
    ;

dec: decv ';' {$$ = $1;}
    | decf  {$$ = $1;}
    ;

decv: var {$$ = $1;}
    | array {$$ = $1;}
    ; 

var: inttype TK_IDENTIFIER ':' lit {$$ = astCreate(AST_DECL_VAR, 0, $1, astSymbol($2), $4, 0);}
    | floattype TK_IDENTIFIER ':' LIT_INTEGER '/' LIT_INTEGER {$$ = astCreate(AST_DECL_VAR_FLOAT, 0, astSymbol($2), astSymbol($4), astSymbol($6), 0);}
    ;  

lit: LIT_INTEGER {$$ = astSymbol($1);}
    | LIT_CHAR {$$ = astSymbol($1);}
    ;

array: inttype TK_IDENTIFIER '[' LIT_INTEGER ']' ':' litl {$$ = astCreate(AST_DECL_ARR_LIT, 0, $1, astSymbol($2), astSymbol($4), $7);}
    | inttype TK_IDENTIFIER '[' LIT_INTEGER ']' {$$ = astCreate(AST_DECL_ARR_EMPT, 0, $1, astSymbol($2), astSymbol($4), 0);}
    | floattype TK_IDENTIFIER '[' LIT_INTEGER ']' ':' litl {$$ = astCreate(AST_DECL_ARR_LIT, 0, $1, astSymbol($2), astSymbol($4), $7);}
    | floattype TK_IDENTIFIER '[' LIT_INTEGER ']' {$$ = astCreate(AST_DECL_ARR_EMPT, 0, $1, astSymbol($2), astSymbol($4), 0);}
    ;

litl: lit litl {$$ = astCreate(AST_LITL, 0, $1, $2, 0, 0);}
    | lit   {$$ = $1;}
    ;

inttype: KW_INT {$$ = astCreate(AST_INT, 0, 0, 0, 0, 0);}
    | KW_CHAR {$$ = astCreate(AST_CHAR, 0, 0, 0, 0, 0);}
    ;

floattype: KW_FLOAT {$$ = astCreate(AST_FLOAT, 0, 0, 0, 0, 0);}
    ;


decf: inttype TK_IDENTIFIER '(' parl ')' cmd {$$ = astCreate(AST_DECL_FUNC, 0, $1, astSymbol($2), $4, $6);}
    | floattype TK_IDENTIFIER '(' parl ')' cmd {$$ = astCreate(AST_DECL_FUNC, 0, $1, astSymbol($2), $4, $6);}
    ;

parl: par restoparl {$$ = astCreate(AST_PARL, 0, $1, $2, 0, 0);}
    | {$$ = 0;}
    ;

restoparl: ',' par restoparl {$$ = astCreate(AST_PARL, 0, $2, $3, 0, 0);}
    | {$$ = 0;}
    ;

par: inttype TK_IDENTIFIER {$$ = astCreate(AST_PAR, 0, $1, astSymbol($2), 0, 0);}
    | floattype TK_IDENTIFIER {$$ = astCreate(AST_PAR, 0, $1, astSymbol($2), 0, 0);}
    ;

body: '{' cmdl '}' {$$ = astCreate(AST_BODY, 0, $2, 0, 0, 0);}
    ;

cmdl: cmd ';' cmdl {$$ = astCreate(AST_CMDL_CMD, 0, $1, $3, 0, 0);}
    | rot  ':' cmdl {$$ = astCreate(AST_CMDL_ROT, 0, $1, $3, 0, 0);}
    | {$$ = 0;}
    ;

cmd: attr   {$$ = $1;}
    | control   {$$ = $1;}
    | print {$$ = $1;}
    | return    {$$ = $1;}
    | body  {$$ = $1;}
    |   {$$ = 0;}
    ;

attr: TK_IDENTIFIER '=' expr {$$ = astCreate(AST_ATTR, 0, astSymbol($1), $3, 0, 0);}
    | TK_IDENTIFIER '[' expr ']' '=' expr {$$ = astCreate(AST_ATTR_VEC, 0, astSymbol($1), $3, $6, 0);}
    ;

print: KW_PRINT printl {$$ = astCreate(AST_PRINT, 0, $2, 0, 0, 0);}
    ;

printl: expr ',' printl {$$ = astCreate(AST_PRINTL, 0, $1, $3, 0, 0);}
    | LIT_STRING ',' printl {$$ = astCreate(AST_PRINTL, 0, astSymbol($1), $3, 0, 0);}
    | expr {$$ = $1;}
    | LIT_STRING {$$ = astSymbol($1);}
    ;

return: KW_RETURN expr {$$ = astCreate(AST_RET, 0, $2, 0, 0, 0);}
    ;

expr: TK_IDENTIFIER {$$ = astSymbol($1);}
    | TK_IDENTIFIER '[' expr ']'  {$$ = astCreate(AST_EXPR_VEC, 0, astSymbol($1), $3, 0, 0);}
    | lit {$$ = $1;}
    | '(' expr ')' {$$ = astCreate(AST_EXPR_PAR, 0, $2, 0, 0, 0);}
    | expr '+' expr {$$ = astCreate(AST_ADD, 0, $1, $3, 0, 0);}
    | expr '-' expr {$$ = astCreate(AST_SUB, 0, $1, $3, 0, 0);}
    | expr '*' expr {$$ = astCreate(AST_MUL, 0, $1, $3, 0, 0);}
    | expr '/' expr {$$ = astCreate(AST_DIV, 0, $1, $3, 0, 0);}
    | expr '<' expr {$$ = astCreate(AST_LESS, 0, $1, $3, 0, 0);}
    | expr '>' expr {$$ = astCreate(AST_GREAT, 0, $1, $3, 0, 0);}
    | expr OPERATOR_LE expr {$$ = astCreate(AST_LE, 0, $1, $3, 0, 0);}
    | expr OPERATOR_GE expr {$$ = astCreate(AST_GE, 0, $1, $3, 0, 0);}
    | expr OPERATOR_EQ expr {$$ = astCreate(AST_EQ, 0, $1, $3, 0, 0);} 
    | expr OPERATOR_DIF expr {$$ = astCreate(AST_DIF, 0, $1, $3, 0, 0);}
    | fcall {$$ = $1;}
    | KW_READ {$$ = astCreate(AST_READ, 0, 0, 0, 0, 0);}
    ;

fcall: TK_IDENTIFIER '(' argl ')' {$$ = astCreate(AST_FCALL, 0, astSymbol($1), $3, 0, 0);}
    ;

argl: expr restoargl    {$$ = astCreate(AST_ARGL, 0, $1, $2, 0, 0);}
    |   {$$ = 0;}
    ;

restoargl: ',' expr restoargl {$$ = astCreate(AST_ARGL, 0, $2, $3, 0, 0);}
    |   {$$ = 0;}
    ;

control: KW_IF expr KW_THEN cmd {$$ = astCreate(AST_IF, 0, $2, $4, 0, 0);} %prec IF
    | KW_IF expr KW_THEN cmd KW_ELSE cmd {$$ = astCreate(AST_IF_ELSE, 0, $2, $4, $6, 0);}
    | KW_WHILE expr cmd {$$ = astCreate(AST_WHILE, 0, $2, $3, 0, 0);}
    | KW_GOTO rot {$$ = astCreate(AST_GOTO, 0, $2, 0, 0, 0);}
    ;

rot: TK_IDENTIFIER {$$ = astSymbol($1);}
    ;

%%

int yyerror(){
    fprintf(stderr, "Syntax error at line %d.\n", getLineNumber());
    exit(3);
}