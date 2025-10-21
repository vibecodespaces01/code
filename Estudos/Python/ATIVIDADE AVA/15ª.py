# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 15. Crie uma função chamada conta_maiusculas(texto) que receba uma string 
    # e retorne quantas letras maiúsculas existem nela. 
        # ● Mostre os resultados usando f-string e format(). 

def conta_maiusculas(texto):
    contador = 0
    for letra in texto:
        if letra.isupper():
            contador += 1
    return contador
texto = input("Digite um texto: ")
resultado = conta_maiusculas(texto)
print(f"Número de letras maiúsculas (usando f-string): {resultado}")
print("Número de letras maiúsculas (usando format()): {}".format(resultado))

