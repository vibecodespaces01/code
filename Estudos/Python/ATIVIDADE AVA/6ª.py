# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 6. Crie um programa que peça nomes ao usuário e guarde em uma lista até que ele digite "sair". 
    # Ao final, mostre todos os nomes digitados. 
        # ● Mostre os resultados usando f-string e format(). 

nomes = []
while True:
    nome = input("Digite um nome (ou 'sair' para encerrar): ").strip()
    if nome.lower() == 'sair':
        break
    nomes.append(nome) 
print("Nomes digitados:")
for i, nome in enumerate(nomes, start=1):
    print("{}. {}".format(i, nome))
print(f"Total de nomes digitados: {len(nomes)}")
