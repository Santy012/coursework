%{
/* Calculadora normal: precedencia y asociatividad usuales
   Generada a partir de la tabla de precedencia; ver README.md. */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
int yyerror(char* s);
%}

%token NUMBER BOOL
%token OP CP
%token EXP
%token MUL DIV
%token ADD SUB
%token ABS AND MOD
%token NOT LESS GREAT
%token EOL

%%
calclist: /* vacío */
    | calclist expr EOL { printf("= %d\n", $2); }
    | calclist EOL      { /* línea vacía */ }
;

expr: nivel0
    | NOT nivel0 {
        if ($2 == 0 || $2 == 1) {
            $$ = !$2;
        } else {
            yyerror("negación aplicada a un valor no booleano");
        }
    }
;


/* ABS: asociativo por la izquierda */
nivel0: nivel1
    | nivel0 ABS nivel1 { $$ = $1 | $3; }
;

/* AND: asociativo por la izquierda */
nivel1: nivel2
    | nivel1 AND nivel2 { $$ = $1 & $3; }
;

/* LESS GREAT: no asociativo */
nivel2: nivel3
    | nivel3 LESS nivel3 { $$ = ($1 < $3) ? 1 : 0; }
    | nivel3 GREAT nivel3 { $$ = ($1 > $3) ? 1 : 0; }
;

/* MOD: no asociativo */
nivel3: nivel4
    | nivel4 MOD nivel4 { if ($3 == 0) yyerror("división por cero"); $$ = $1 % $3; }
;

/* ADD SUB: asociativo por la izquierda */
nivel4: nivel5
    | nivel4 ADD nivel5 { $$ = $1 + $3; }
    | nivel4 SUB nivel5 { $$ = $1 - $3; }
;

/* MUL DIV: asociativo por la izquierda */
nivel5: nivel6
    | nivel5 MUL nivel6 { $$ = $1 * $3; }
    | nivel5 DIV nivel6 { if ($3 == 0) yyerror("división por cero"); $$ = $1 / $3; }
;

/* EXP: asociativo por la derecha */
nivel6: unario
    | unario EXP nivel6 { $$ = (int) pow($1, $3); }
;

unario: atomo
    | SUB unario { $$ = -$2; }
;

atomo: NUMBER
    | BOOL
    | ABS unario ABS { $$ = $2 >= 0 ? $2 : -$2; }
    | OP expr CP     { $$ = $2; }
;

%%
int main(int argc, char **argv)
{
    yyparse();
    return 0;
}

int yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
    exit(EXIT_FAILURE);
}
