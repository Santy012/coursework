"""Evalúa un archivo de expresiones con una de las cuatro gramáticas.

Uso:  python MainCalculadora.py EjemploEntradaCalc.txt [1|2|3|4]
Sin el número de gramática, se pregunta con un menú.
"""
import sys
from antlr4 import CommonTokenStream, FileStream, InputStream
from CalculadoraLexer import CalculadoraLexer
from CalculadoraParser import CalculadoraParser
from CalculadoraPreLexer import CalculadoraPreLexer
from CalculadoraPreParser import CalculadoraPreParser
from CalculadoraAsoLexer import CalculadoraAsoLexer
from CalculadoraAsoParser import CalculadoraAsoParser
from CalculadoraModLexer import CalculadoraModLexer
from CalculadoraModParser import CalculadoraModParser
from EvalVisitor import EvalVisitor

GRAMATICAS = {
    '1': ('precedencia usual, asociatividad usual', CalculadoraLexer, CalculadoraParser),
    '2': ('precedencia modificada, asociatividad usual', CalculadoraPreLexer, CalculadoraPreParser),
    '3': ('precedencia usual, asociatividad modificada', CalculadoraAsoLexer, CalculadoraAsoParser),
    '4': ('precedencia modificada, asociatividad modificada', CalculadoraModLexer, CalculadoraModParser),
}


def main():
    entrada = FileStream(sys.argv[1], encoding='utf-8') if len(sys.argv) > 1 else InputStream(input() + '\n')
    if len(sys.argv) > 2:
        opcion = sys.argv[2]
    else:
        print('\nGramáticas disponibles (detalle en el README):')
        for clave, (desc, _, _) in GRAMATICAS.items():
            print(f'  {clave}: {desc}')
        opcion = input('Número de la gramática: ')
    if opcion not in GRAMATICAS:
        print('Opción no válida.')
        return
    _, Lexer, Parser = GRAMATICAS[opcion]
    arbol = Parser(CommonTokenStream(Lexer(entrada))).prog()
    EvalVisitor().visit(arbol)


if __name__ == '__main__':
    main()
