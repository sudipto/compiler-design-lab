%%
(a|b)*a[a|b]			printf("%s is accepted", yytext);
(((a|b)*(c+d)*)+)|(ab*c*d*)	printf("%s is accepted", yytext);
(0|1)*|0*1*			printf("%s is accepted", yytext);
((01*2)|(0*2)|1)+		printf("%s is accepted", yytext);
(0|1)*0(0|1)(0|1)		printf("%s is accpeted", yytext);
.*				printf("Failed");
%%
int yywrap() {
	return 1;
}

int main() {
	yylex();
	return 0;
}
