# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 9. Crie uma função chamada analise_lista(numeros) que receba uma lista de inteiros e retorne a soma, 
    # o maior e o menor número. 
        # ● O programa deve pedir 5 números ao usuário, guardar em uma lista e chamar a função. 
        # ● Mostre os resultados usando f-string e format(). 

def analise_lista(numeros):
    soma = sum(numeros)
    maior = max(numeros)
    menor = min(numeros)
    return soma, maior, menor
while True:
    numeros = []
    print("\nDigite 5 números ou 'sair' a qualquer momento para encerrar:")
    i = 0
    while i < 5:
        entrada = input(f"Digite o {i+1}º número: ")
        if entrada.lower() == 'sair':
            print("Encerrando o programa. Até mais!")
            exit()
        try:
            numero = int(entrada)
            numeros.append(numero)
            i += 1  # Só avança se a entrada for válida
        except ValueError:
            print("Entrada inválida. Por favor, digite um número inteiro válido.")
    soma, maior, menor = analise_lista(numeros)
    print("\nResultados:")
    print("A soma dos números é: {}".format(soma))
    print(f"O maior número é: {maior}")
    print(f"O menor número é: {menor}")
