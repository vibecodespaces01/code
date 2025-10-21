# Associação Unidirecional em Python
# Neste exemplo, um Motorista pode dirigir um Carro, mas o Carro não conhece o Motorista.

class Carro:
    def __init__(self, marca):
        self.marca = marca

    def ligar_motor(self):
        print(f"O carro da {self.marca} está com o motor ligado.")

class Motorista:
    def __init__(self, nome):
        self.nome = nome
        self.carro_atual = None  # Agregação: Motorista "tem" um carro

    def dirigir(self, carro):
        self.carro_atual = carro
        print(f"{self.nome} está dirigindo o {self.carro_atual.marca}.")
        print(self.carro_atual.ligar_motor())

# Criamos uma instância de Carro
meu_carro = Carro("Toyota")

# Criamos uma instância de Motorista
meu_motorista = Motorista("Carlos Ronaldo")

# O Motorista instancia (interage com) o Carro
meu_motorista.dirigir(meu_carro)

# O objeto atual Motorista agora aponta para o objeto atual Carro
# Nesse Motorista interage com a classe Carro:
print(f"O objeto Motorista {meu_motorista.nome} tem uma referência para o objeto Carro {meu_motorista.carro_atual.marca}.")

# Fim do código
