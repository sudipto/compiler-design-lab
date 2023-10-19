%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token NUM ID NL
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%
start:  exp NL {
    printf("valid expression\n");
    exit(0);
}
;
exp:    exp '+' exp
    |   exp '-' exp
    |   exp '/' exp
    |   exp '*' exp
    |   '-' exp %prec UMINUS
    |   '(' exp ')'
    |   NUM
    |   ID
    ;    
%%

int main() {
    printf("Enter the expression:\n");
    return yyparse();
}

int yyerror(char *s) {
    printf("invalid expression\n");'
    exit(0);
}