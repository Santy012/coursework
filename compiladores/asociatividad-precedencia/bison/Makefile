normal: Calculadora.l Calculadora.y
	bison -d Calculadora.y
	flex Calculadora.l
	cc -o $@ Calculadora.tab.c lex.yy.c -lfl -lm
	
pre: CalculadoraPre.l CalculadoraPre.y
	bison -d CalculadoraPre.y
	flex CalculadoraPre.l
	cc -o $@ CalculadoraPre.tab.c lex.yy.c -lfl -lm
	
aso: CalculadoraAso.l CalculadoraAso.y
	bison -d CalculadoraAso.y
	flex CalculadoraAso.l
	cc -o $@ CalculadoraAso.tab.c lex.yy.c -lfl -lm
	
mod: CalculadoraMod.l CalculadoraMod.y
	bison -d CalculadoraMod.y
	flex CalculadoraMod.l
	cc -o $@ CalculadoraMod.tab.c lex.yy.c -lfl -lm

clean:
	rm -f *.tab.c *.tab.h lex.yy.c normal pre aso mod

.PHONY: clean
