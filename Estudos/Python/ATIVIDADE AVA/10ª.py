# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 10. Crie uma função chamada media_turma(notas) que receba uma tupla de notas (float) 
    # e retorne a média e a classificação da turma: 
        # ● "Excelente" se média ≥ 9 
        # ● "Bom" se 7 ≤ média < 9 
        # ● "Regular" se 5 ≤ média < 7 
        # ● "Ruim" se média < 5 
        # ● Mostre os resultados usando f-string e format(). 

def media_turma(notas):
    media = sum(notas) / len(notas)
    
    if media >= 9:
        classificacao = "Excelente"
    elif 7 <= media < 9:
        classificacao = "Bom"
    elif 5 <= media < 7:
        classificacao = "Regular"
    else:
        classificacao = "Ruim"
    
    return f"Média: {media:.2f}, Classificação: {classificacao}"    
# Exemplo de uso
notas = (8.5, 9.0, 7.5, 6.0, 10.0)
resultado = media_turma(notas)
print(resultado)

