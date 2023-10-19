%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%token A B NL

%%
start:  S NL {
    printf("valid string\n");
    exit(0);
}
;
S:   A B | A S B
;
%%

int main() {
    printf("Enter the string:\n");
    return yyparse();
}

int yyerror(char *s) {
    printf("invalid string\n");
    exit(0);
}