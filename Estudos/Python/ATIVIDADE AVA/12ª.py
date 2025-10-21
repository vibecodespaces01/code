# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 12. Crie uma função chamada conta_vogais(texto) que receba uma string e retorne 
    # a quantidade de vogais presentes. 
        # ● Mostre os resultados usando f-string e format().

def conta_vogais(texto):
    vogais = "aáâàãeéêèiíoóôuúAÁÂÀÃEÉÊÈIÍOÓÔUÚ"
    contador = sum(1 for char in texto if char in vogais)
    return contador
texto = input("Digite uma string: ")
quantidade_vogais = conta_vogais(texto)
print(f"A quantidade de vogais na string é: {quantidade_vogais}")
print("{} é a quantidade de vogais na string".format(quantidade_vogais))  
