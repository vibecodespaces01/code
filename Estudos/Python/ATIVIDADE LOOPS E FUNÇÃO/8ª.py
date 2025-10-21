# Crie uma função que receba um número e retorne True se ele for par e False caso contrário

# Função que verifica se um número é par
def eh_par(numero):
    return numero % 2 == 0

# Exemplo de uso
n = int(input("Digite um número: "))
if eh_par(n):
    print("O número é par.")
else:
    print("O número é ímpar.")
