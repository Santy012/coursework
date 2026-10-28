grammar CalculadoraMod;
// precedencia y asociatividad invertidas.
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
    |   <assoc=right> expr op=('%'|'//') expr     # ModCoc
    |   <assoc=right> expr op=('+'|'-') expr      # AddSub
    | <assoc=right> expr op=('*'|'/') expr      # MulDiv
    |   expr '^' expr             # Exp
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
