# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 23 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Exemplo- Composição

class Coração:
    def __init__(self):
        self.batendo = True

    def bater(self):
        if self.batendo:
            print("❤️ Tum-tum...")

class Pessoa:
    def __init__(self, nome):
        self.nome = nome
        self.coracao = Coração()  # composição: o coração só existe com a pessoa

    def viver(self):
        print(f"{self.nome} está vivo!")
        self.coracao.bater()

# Criando pessoa
p1 = Pessoa("Carlos Ronaldo")
p1.viver()
