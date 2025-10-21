# Bolsa Futuro Digital 
# São José de Ribamar, 31 de agosto de 2025. 
# Discente: Renato da Fonseca Oliveira 
 
# Atividade Avaliativa - Python 
 
    # 1. Peça ao usuário 5 números, armazene em uma lista e mostre:  
        # ● A soma de todos os números  
        # ● O maior e o menor número  
        # ● (use for e if/else, não max() e min()).  
        # ● É para o programa ficar em execução enquanto o usuário não digitar a palavra sair.  
        # ● Mostre os resultados usando f-string e format().  
 
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
            numero = float(entrada) 
            numeros.append(numero) 
            i += 1  # Só avança se a entrada for válida 
        except ValueError: 
            print("Entrada inválida. Por favor, digite um número válido.") 

    # Inicializa variáveis 
    soma = 0 
    maior = numeros[0] 
    menor = numeros[0] 
 
    # Processa os números 
    for num in numeros: 
        soma += num 
        if num > maior: 
            maior = num 
        elif num < menor: 
            menor = num 
 
    # Exibe os resultados 
    print("\nResultados:") 
    print("A soma dos números é: {}".format(soma)) 
    print(f"O maior número é: {maior}") 
    print(f"O menor número é: {menor}") 