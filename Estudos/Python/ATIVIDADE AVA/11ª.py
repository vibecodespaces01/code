# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 11. Crie uma função chamada resultado_alunos(alunos) que receba um dicionário no formato
    # {nome: nota} e retorne outro dicionário com {nome: "Aprovado"/"Reprovado"}. 
        # ● Mostre os resultados usando f-string e format(). 

def resultado_alunos(alunos):
    resultados = {}
    for nome, nota in alunos.items():
        if nota >= 7:
            resultados[nome] = "Aprovado(a)"
        else:
            resultados[nome] = "Reprovado(a)"
    return resultados  
# Exemplo de uso
alunos = {
    "Ana": 8,
    "João": 6,
    "Pedro": 9,
    "Maria": 5
}
resultados = resultado_alunos(alunos)
for nome, situacao in resultados.items():
    print(f"O(a) aluno(a) {nome} está {situacao}.")
    print("{} está {}.".format(nome, situacao)) 

