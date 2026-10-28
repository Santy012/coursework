%option noyywrap nodefault yylineno
%{
#include "Calculadora.tab.h"
%}

%%
"<" { return LESS; }
">" { return GREAT; }
"!" { return NOT; }
"%" { return MOD; }
"&" { return AND; }
"|" { return ABS; }
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"^" { return EXP; }
"(" { return OP; }
")" { return CP; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
"true" { yylval = 1; return BOOL; }  
"false" { yylval = 0; return BOOL; }
\n { return EOL; }
[ \t]   { /* ignore white space */ }
"//".* {  }
. { printf("Mystery character %c\n", *yytext); }
%%
