# Crie uma função que receba uma lista de números e retorne a média deles

# Função que calcula a média de uma lista de números
def calcular_media(lista):
    if len(lista) == 0:
        return 0  # Evita divisão por zero
    soma = sum(lista)
    media = soma / len(lista)
    return media

# Exemplo de uso
numeros = []

# Coleta de números do usuário
for i in range(5):
    n = float(input(f"Digite o {i+1}º número: "))
    numeros.append(n)

# Chamada da função e exibição do resultado
resultado = calcular_media(numeros)
print(f"A média dos números digitados é: {resultado:.2f}")