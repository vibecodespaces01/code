# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 3. Crie um dicionário com 3 alunos e suas notas: 
        # ● por exemplo: alunos = {"Ana": 8, "João": 6, "Pedro": 9} 
        # ● Percorra o dicionário com for e mostre cada aluno e sua situação: "Aprovado" (nota ≥ 7) ou 
        # "Reprovado". 
        # ● É para o programa ficar em execução enquanto o usuário não digitar a palavra sair. 
        # ● Mostre os resultados usando f-string e format().

alunos = {"Ana": 8, "João": 6, "Pedro": 9}
while True:
    comando = input("Digite 'sair' para encerrar ou pressione Enter para continuar: ")
    if comando.lower() == 'sair':
        break
    for aluno, nota in alunos.items():
        situacao = "Aprovado(a)" if nota >= 7 else "Reprovado(a)"
        print(f"O(a) aluno(a) {aluno} teve a nota {nota}.")
        print("{} com nota {} está com a situação '{}'.".format(aluno, nota, situacao))
