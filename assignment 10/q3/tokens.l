%{
    #include "y.tab.h"
%}

%%
([0-9]+[0-9]*\.[0-9]+)+ {
    yylval = atof(yytext);
    return NUM;
}
.   return yytext[0];
\n  return NL;
%%

int yywrap() {
    return 1;
}