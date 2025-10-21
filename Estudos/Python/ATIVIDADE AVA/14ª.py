# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 14. Crie uma função chamada coletar_nomes() que peça nomes ao usuário até que
    # ele digite "sair". A função deve retornar a lista de nomes digitados. 
        # ● Mostre os resultados usando f-string e format().

def coletar_nomes():
    nomes = []
    while True:
        nome = input("Digite um nome (ou 'sair' para encerrar): ")
        if nome.lower() == 'sair':
            break
        nomes.append(nome)
    return nomes
nomes_coletados = coletar_nomes()
print(f"Nomes coletados (usando f-string): {nomes_coletados}")
print("Nomes coletados (usando format()): {}".format(nomes_coletados))
