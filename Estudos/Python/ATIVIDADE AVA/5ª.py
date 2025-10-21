# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 5. Peça ao usuário dois números float (números reais) e crie uma função que calcule: 
        # ● soma 
        # ● subtração 
        # ● multiplicação 
        # ● divisão 
        # ● É para o programa ficar em execução enquanto o usuário não digitar a palavra sair. 
        # ● Mostre os resultados usando f-string e format().

def calcular_operacoes(num1, num2):
    soma = num1 + num2
    subtracao = num1 - num2
    multiplicacao = num1 * num2
    divisao = num1 / num2 if num2 != 0 else 'Indefinido (divisão por zero)'
    return soma, subtracao, multiplicacao, divisao
while True:
    entrada1 = input("Digite o primeiro número (ou 'sair' para encerrar): ").strip().lower()
    if entrada1 == 'sair':
        print("Encerrando o programa. Até mais!")
        break
    entrada2 = input("Digite o segundo número (ou 'sair' para encerrar): ").strip().lower()
    if entrada2 == 'sair':
        print("Encerrando o programa. Até mais!")
        break
    
    try:
        num1 = float(entrada1)
        num2 = float(entrada2)
    except ValueError:
        print("Por favor, digite números válidos.")
        continue
    
    soma, subtracao, multiplicacao, divisao = calcular_operacoes(num1, num2)
    
    # Resultados usando f-string e format()
    print("Resultados para os números {} e {}:".format(num1, num2))
    print("Soma: {}".format(soma))
    print("Subtração: {}".format(subtracao))
    print(f"Multiplicação: {multiplicacao}")
    print(f"Divisão: {divisao}")
    