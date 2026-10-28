grammar CalculadoraPre;
// precedencia invertida: % y // ligan más fuerte y ^ más débil; asociatividad usual.
// El orden de las alternativas de expr define la precedencia (de mayor a menor).
prog:   stat+ ;

stat:   expr NEWLINE                # printExpr
    |   ID '=' expr NEWLINE         # assign
    |   NEWLINE                     # blank
    ;

expr: INT                         # int
    |   BOOL       # bool
    |   ID                          # id
    |   '-' expr                    # NegNum
    | '(' expr ')'                # parens
    |   '|' expr '|'      # Abs
    |   '!' expr             # NotBool
    |   expr op=('%'|'//') expr     # ModCoc
    |   expr op=('+'|'-') expr      # AddSub
    | expr op=('*'|'/') expr      # MulDiv
    |   <assoc=right> expr '^' expr             # Exp
    |   trigFunc                    # TrigFunction
    ;

trigFunc : 'cos' expr               # CosFunc
         | 'sen' expr               # SenFunc
         | 'tan' expr      # TanFunc
         ;

BOOL :  'true'|'false' ;
ID  :   [a-zA-Z]+ ;
INT :   [0-9]+ ;
MOD :   '%' ;
COC :   '//' ;
ADD :   '+' ;
SUB :   '-' ;
MUL :   '*' ;
DIV :   '/' ;
EXP :   '^' ;
NOT :   '!' ;
TAN :   'tan' ;
NEWLINE:'\r'? '\n' ;     // return newlines to parser (is end-statement signal)
WS  :   [ \t]+ -> skip ; // toss out whitespace
