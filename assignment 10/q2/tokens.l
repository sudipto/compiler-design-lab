%{
    #include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]*    return ID;
[0-9]+  return NUM;
.   return yytext[0];
\n  return NL;
%%

int yywrap() {
    return 1;
}