# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 13. Crie uma função chamada operacoes(a, b) que receba dois números float 
    # e retorne uma tupla contendo: soma, subtração, multiplicação e divisão. 
        # ● Mostre os resultados usando f-string e format(). 

def operacoes(a, b):
    soma = a + b
    subtracao = a - b
    multiplicacao = a * b
    divisao = a / b if b != 0 else "Divisão por zero não é permitida"
    return (soma, subtracao, multiplicacao, divisao)

# Solicita ao usuário dois números float
try:   
    num1 = float(input("Digite o primeiro número (float): "))
    num2 = float(input("Digite o segundo número (float): "))

    # Chama a função e obtém os resultados
    resultados = operacoes(num1, num2)

    # Mostra os resultados usando f-string e format()
    print(f"Soma: {resultados[0]:.2f}")
    print("Subtração: {:.2f}".format(resultados[1]))
    print(f"Multiplicação: {resultados[2]:.2f}")
    print("Divisão: {}".format(resultados[3]))
except ValueError:
    print("Entrada inválida. Por favor ao rodar programa, digite números float válidos.") 


