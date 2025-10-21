#Faça um programa que peça números ao usuário até que ele digite 0. Ao final, mostre a soma de todos os números digitados

# Inicializa a variável de soma
soma = 0

# valor inicial diferente de 0 para entrar no loop
numero = ""

while numero != 0:
    try:
        numero = int(input("Digite um número (0 para sair): "))
        soma = soma + numero
    except ValueError:
        print("Entrada inválida. Por favor, digite apenas números.")

print("A soma dos números digitados é:", soma)