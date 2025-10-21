# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 4. Peça ao usuário uma palavra e conte quantas vogais (a, e, i, o, u) ela possui. 
        # ● É para o programa ficar em execução enquanto o usuário não digitar a palavra sair. 
        # ● Mostre os resultados usando f-string e format().

while True:
    palavra = input("Digite uma palavra (ou 'sair' para encerrar): ").strip().lower()
    
    if palavra == 'sair':
        print("Encerrando o programa. Até mais!")
        break
    
    vogais = 'aeiou'
    contador_vogais = sum(1 for letra in palavra if letra in vogais)
    
    # Usando f-string
    print(f"A palavra '{palavra}' possui {contador_vogais} vogais.")
    
    # Usando format()
    print("A palavra '{}' possui {} vogais.".format(palavra, contador_vogais))
    