%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token NUM NL
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%
start:  e NL {
    printf(" = %2.2f", $$);
}
;
e:      e'+'e { $$ = $1 + $3; }
    |   e'-'e { $$ = $1 - $3; }
    |   e'*'e { $$ = $1 * $3; }
    |   e'/'e { 
        if($3 == 0) {
            yyerror("divided by zero\n");
        } else {
            $$ = $1 / $3;
        }
    }
    |   '-' e %prec UMINUS { $$ = -$2; }
    |   '('e')' { $$ = $2; }
    |   NUM { $$ = $1; }
;
%%

int main() {
    printf("Enter the arithmetic expression:\n");
    yyparse();
    printf("valid expression\n");
    return 0;
}

int yyerror(char *s) {
    printf("invalid expression\n");
    exit(0);
}