# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 7. Escreva um programa que percorra uma string e conte quantos caracteres são letras maiúsculas. 
        # ● Mostre os resultados usando f-string e format().

string = input("Digite uma string: ").strip()
contador_maiusculas = sum(1 for char in string if char.isupper())
print("Número de letras maiúsculas na string: {}".format(contador_maiusculas))
print(f"{contador_maiusculas} é o número de letras maiúsculas na string.") 
