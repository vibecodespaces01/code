# Escreva um programa que mostre a tabuada de um número escolhido pelo usuário, de 1 até 10, usando while 

# Solicita o número ao usuário
numero = int(input("Digite um número: "))

# Inicializa o contador
contador = 1

# Loop para mostrar todas as operações de 1 até 10
while contador <= 10:
    soma = numero + contador
    subtracao = numero - contador
    multiplicacao = numero * contador

    print(f"{numero} + {contador} = {soma}")
    print(f"{numero} - {contador} = {subtracao}")
    print(f"{numero} x {contador} = {multiplicacao}")

    print("-" * 30)  # Separador visual
    contador += 1

# Fim do Código