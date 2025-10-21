# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 23 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Exemplo- Agregação

class Professor:
    def __init__(self, nome):
        # Armazena o nome do professor
        self.nome = nome

    def ministrar_aula(self):
        # Simula a ação de ministrar uma aula
        print(f"Professor(a) {self.nome} está dando aula.")

class Escola:
    def __init__(self, nome):
        # Nome da escola
        self.nome = nome
        # Lista que guarda referências a objetos Professor (agregação)
        self.professores = []  # agregação: guarda referências a objetos Professor

    def adicionar_professor(self, professor):
        # Adiciona um objeto Professor à lista da escola
        # Observação: o professor existe independentemente da escola (agregação)
        self.professores.append(professor)

    def mostrar_professores(self):
        # Exibe os professores associados à escola
        print(f"Professores da escola {self.nome}:")
        for prof in self.professores:
            print("-", prof.nome)

# Criando professores (existem independentemente da escola)
prof1 = Professor("Juliane")
prof2 = Professor("Carlos Ronaldo")

# Criando uma escola
escola = Escola("Escola IFMA - Campus São José de Ribamar")

# Associando professores à escola (agregação)
escola.adicionar_professor(prof1)
escola.adicionar_professor(prof2)

# Professores podem existir sem a escola
escola.mostrar_professores()
prof1.ministrar_aula()
