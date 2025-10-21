# Exemplo de uso do Exceção Personalizada em Python

class subzero(Exception):
    pass

x = -1
if x < 0:
    raise subzero("Desculpe, não aceitamos números abaixo de zero.")