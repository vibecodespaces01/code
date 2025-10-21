# Exemplo de uso do Exceção Personalizada em Python

x = "Olá!"

if not type(x) is int:
    raise TypeError("Somente números inteiros são permitidos")
