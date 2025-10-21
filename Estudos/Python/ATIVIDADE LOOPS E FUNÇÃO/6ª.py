# Crie um programa que percorra uma string digitada pelo usuário e conte quantas vogais ela possui

# Solicita a string ao usuário
texto = input("Digite uma frase ou palavra: ")

# Define as vogais
vogais = "aáâàãeéêèiíoóôuúAÁÂÀÃEÉÊÈIÍOÓÔUÚ"

# Inicializa o contador
contador_vogais = 0

# Percorre cada caractere da string
for letra in texto:
    if letra in vogais:
        contador_vogais += 1

# Exibe o resultado
print(f"A quantidade de vogais na frase é: {contador_vogais}")
