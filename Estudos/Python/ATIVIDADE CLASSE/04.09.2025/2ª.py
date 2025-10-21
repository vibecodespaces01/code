# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 2. Crie uma classe chamada Cachorro com os atributos nome e idade. Adicione um método que exibe "Au au, meu nome é X e tenho Y anos".

class Cachorro:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

    def latir(self):
        return f"Au au, meu nome é {self.nome} e tenho {self.idade} anos."
cachorro1 = Cachorro("Rex", 5)
cachorro2 = Cachorro("Luna", 3)
print(cachorro1.latir())
print(cachorro2.latir())

# Fim do código.

