# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 23 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Exemplo- Associação, Agregação e Composição

# 2. Crie uma classe Professor e uma classe Universidade. 
# # A Universidade pode ter vários professores. 
# # Mas os Professores também podem existir sem a Universidade. 

class Professor:
    def __init__(self, nome):
        self.nome = nome  # Nome do professor

    def ensinar(self):
        print(f"Professor {self.nome} está ensinando.")

class Universidade:
    def __init__(self, nome):
        self.nome = nome  # Nome da universidade
        self.professores = []  # Lista de professores (associação)

    def adicionar_professor(self, professor):
        self.professores.append(professor)  # Adiciona um professor à universidade

    def listar_professores(self):
        print(f"Professores na {self.nome}:")
        for prof in self.professores:
            print("-", prof.nome)
# Associação: Professores podem existir sem a Universidade
prof1 = Professor("Ana")
prof2 = Professor("Bruno")  
uni = Universidade("Universidade Federal do Maranhão")

# Interações entre Universidade e Professores
uni.adicionar_professor(prof1)
uni.adicionar_professor(prof2)
uni.listar_professores()
prof1.ensinar()