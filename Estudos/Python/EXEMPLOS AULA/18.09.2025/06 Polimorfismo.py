class Carro:
    def __init__(self, modelo, ano):
        self.modelo = modelo
        self.ano = ano

    def mover(self):
        print ("Dirigir")

class Aviao:
    def __init__(self, modelo, ano):
        self.modelo = modelo
        self.ano = ano

    def mover(self):
        print ("Voar")

class Barco:
    def __init__(self, modelo, ano):
        self.modelo = modelo
        self.ano = ano

    def mover(self):
        print ("Navegar")

carro1 = Carro("Fusca", 1980)
aviao1 = Aviao("Cessna", None)
barco1 = Barco("Lancha", 2010)

for x in (carro1, barco1, aviao1):
    x.mover()