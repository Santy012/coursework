# Asociatividad y precedencia en una calculadora

Cuatro versiones de la misma calculadora, implementadas dos veces: con **Bison + Flex** (C) y con **ANTLR 4** (Python). Las versiones solo cambian el orden en que se agrupan las operaciones, así que la misma entrada da resultados distintos según la gramática:

| Versión | Precedencia | Asociatividad |
|---|---|---|
| Normal | usual | usual |
| Pre | modificada | usual |
| Aso | usual | modificada |
| Mod | modificada | modificada |

**Precedencia usual** (de mayor a menor): `^`, luego `*` `/`, luego `+` `-`, luego `%` (y `//` en ANTLR). **Modificada**: el orden se invierte, `%` liga más fuerte y `^` más débil. En Bison, por debajo de toda la aritmética (ligan más débil) están las comparaciones `<` `>`, luego `&` y por último `|`, iguales en las cuatro versiones.

**Asociatividad usual**: `+ - * / % //` por la izquierda (`7-4-3 = (7-4)-3`) y `^` por la derecha (`2^3^2 = 2^(3^2)`). **Modificada**: al revés (`7-4-3 = 7-(4-3)`, `2^3^2 = (2^3)^2`).

Autores: Santiago Castellanos y Catalina Gutiérrez.

## Cómo se expresa en cada herramienta

- **Bison**: la precedencia sale de la cadena de no terminales (cada nivel de operadores es una regla que llama a la del nivel siguiente) y la asociatividad, de la recursión: `suma: suma ADD termino` agrupa por la izquierda y `suma: termino ADD suma` por la derecha. Las cuatro gramáticas se generan a partir de una sola tabla de niveles, así que difieren únicamente en esas dos cosas.
- **ANTLR 4**: la precedencia es el orden de las alternativas de `expr` (la primera liga más fuerte) y la asociatividad por la derecha se marca con `<assoc=right>`. Como las cuatro gramáticas usan las mismas etiquetas, un único `EvalVisitor` evalúa todas.

## Uso

Bison (requiere `bison`, `flex` y un compilador de C):

```bash
cd bison
make normal pre aso mod
./aso < EjemploEntradasCalc.txt
make clean
```

ANTLR (requiere Java, `pip install antlr4-tools antlr4-python3-runtime==4.13.2`):

```bash
cd antlr
for g in Calculadora CalculadoraPre CalculadoraAso CalculadoraMod; do
  antlr4 -v 4.13.2 -Dlanguage=Python3 -no-listener -visitor $g.g4
done
python MainCalculadora.py EjemploEntradaCalc.txt 3   # 1 normal, 2 Pre, 3 Aso, 4 Mod
```

La versión ANTLR admite además variables (`x = 7`), `//` (división entera) y `sen`, `cos`, `tan` en grados; la versión Bison trabaja con enteros y añade comparaciones y operadores lógicos.

## Resultados con los archivos de ejemplo

### Bison

| Expresión | Normal | Pre | Aso | Mod |
|---|---:|---:|---:|---:|
| `2*10%3+1` | 0 | 4 | 0 | 4 |
| `2-2*4^2` | -30 | 0 | -30 | 0 |
| `18/2*3` | 27 | 27 | 3 | 3 |
| `20/10/2` | 1 | 1 | 4 | 4 |
| `5-3-1-1` | 0 | 0 | 2 | 2 |
| `10/3` | 3 | 3 | 3 | 3 |
| `-(2+4)` | -6 | -6 | -6 | -6 |
| `2-4-3` | -5 | -5 | 1 | 1 |
| `4-2-3-1` | -2 | -2 | 4 | 4 |
| `\|(0-2)\|` | 2 | 2 | 2 | 2 |
| `10%3` | 1 | 1 | 1 | 1 |
| `10 < 8` | 0 | 0 | 0 | 0 |
| `8 < 10` | 1 | 1 | 1 | 1 |
| `10 > 2` | 1 | 1 | 1 | 1 |
| `2^3^2` | 512 | 512 | 64 | 64 |
| `-2+3` | 1 | 1 | 1 | 1 |

### ANTLR

| Expresión | Normal | Pre | Aso | Mod |
|---|---:|---:|---:|---:|
| `10/2` | 5.0 | 5.0 | 5.0 | 5.0 |
| `20/10/2` | 1.0 | 1.0 | 4.0 | 4.0 |
| `-5+2` | -3 | -3 | -3 | -3 |
| `5-2` | 3 | 3 | 3 | 3 |
| `(8+2)+2` | 12 | 12 | 12 | 12 |
| `2^4` | 16 | 16 | 16 | 16 |
| `2*6/2*3` | 18.0 | 18.0 | 2.0 | 2.0 |
| `12-1+3` | 14 | 14 | 8 | 8 |
| `10%4//3` | 0 | 0 | 0 | 0 |
| `7-4-3` | 0 | 0 | 6 | 6 |
| `2-3-4+5-3` | -3 | -3 | 5 | 5 |
| `2-3-4+5-3` | -3 | -3 | 5 | 5 |
| `2-(3-(4+(5-3)))` | 5 | 5 | 5 | 5 |
| `2+3*4-5+2` | 11 | 5 | 7 | -15 |
| `(10%2+1)*4` | 4 | 4 | 4 | 4 |
| `(2-4+(-5)-3)/2` | -5.0 | -5.0 | 3.0 | 3.0 |
| `2^3^2` | 512 | 512 | 64 | 64 |

Las filas en las que coinciden las cuatro columnas son las que no dependen del orden de agrupación (una sola operación, paréntesis explícitos u operaciones de un mismo nivel que conmutan).
