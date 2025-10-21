# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 2. Dada a tupla notas = (7.5, 8.0, 5.0, 9.0, 6.5), calcule a média e classifique o desempenho da turma: 
        # ● "Excelente" se média ≥ 9 
        # ● "Bom" se 7 ≤ média < 9 
        # ● "Regular" se 5 ≤ média < 7 
        # ● "Ruim" se média < 5 
        # ● É para o programa ficar em execução enquanto o usuário não digitar a palavra sair. 
        # ● Mostre os resultados usando f-string e format(). 

notas = (7.5, 8.0, 5.0, 9.0, 6.5)
while True:
    comando = input("Digite 'sair' para encerrar ou pressione Enter para continuar: ")
    if comando.lower() == 'sair':
        break
    media = sum(notas) / len(notas)
    if media >= 9:
        desempenho = "Excelente"
    elif 7 <= media < 9:
        desempenho = "Bom"
    elif 5 <= media < 7:
        desempenho = "Regular"
    else:
        desempenho = "Ruim"
    print(f"A média da turma é {media:.2f}")
    print("Tendo a média {:.2f} a turma teve um desempenho '{}'.".format(media, desempenho))
