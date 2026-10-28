"""Evaluador común a las cuatro gramáticas.

Las gramáticas solo difieren en precedencia y asociatividad, que ANTLR resuelve al construir
el árbol; las etiquetas de las alternativas son las mismas, así que un único visitante sirve
para todas: siempre evalúa el subárbol izquierdo y luego el derecho.
"""
import math
from antlr4 import ParseTreeVisitor


class EvalVisitor(ParseTreeVisitor):
    def __init__(self):
        self.memory = {}

    def visitProg(self, ctx):
        return self.visitChildren(ctx)

    def visitAssign(self, ctx):
        value = self.visit(ctx.expr())
        self.memory[ctx.ID().getText()] = value
        return value

    def visitPrintExpr(self, ctx):
        print('=', self.visit(ctx.expr()))
        return 0

    def visitBlank(self, ctx):
        return 0

    def visitInt(self, ctx):
        return int(ctx.INT().getText())

    def visitBool(self, ctx):
        return ctx.BOOL().getText()

    def visitId(self, ctx):
        return self.memory.get(ctx.ID().getText(), 0)

    def _operandos(self, ctx):
        return self.visit(ctx.expr(0)), self.visit(ctx.expr(1))

    def visitMulDiv(self, ctx):
        left, right = self._operandos(ctx)
        if ctx.op.text == '*':
            return left * right
        if right == 0:
            print('Error: división por cero', end=' ')
            return 0
        return left / right

    def visitAddSub(self, ctx):
        left, right = self._operandos(ctx)
        return left + right if ctx.op.text == '+' else left - right

    def visitModCoc(self, ctx):
        left, right = self._operandos(ctx)
        if right == 0:
            print('Error: división por cero', end=' ')
            return 0
        return left % right if ctx.op.text == '%' else left // right

    def visitExp(self, ctx):
        left, right = self._operandos(ctx)
        return left ** right

    def visitParens(self, ctx):
        return self.visit(ctx.expr())

    def visitNegNum(self, ctx):
        return -self.visit(ctx.expr())

    def visitAbs(self, ctx):
        return abs(self.visit(ctx.expr()))

    def visitNotBool(self, ctx):
        value = self.visit(ctx.expr())
        if value in ('true', 'false'):
            return 'false' if value == 'true' else 'true'
        print('Error: expresión no booleana', end=' ')
        return None

    def visitTrigFunction(self, ctx):
        return self.visit(ctx.trigFunc())

    def visitSenFunc(self, ctx):
        return math.sin(math.radians(self.visit(ctx.expr())))

    def visitCosFunc(self, ctx):
        return math.cos(math.radians(self.visit(ctx.expr())))

    def visitTanFunc(self, ctx):
        return math.tan(math.radians(self.visit(ctx.expr())))
