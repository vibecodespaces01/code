# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 4. Adicione à classe Carro um método chamado dirigir() que imprime "O carro está em movimento". 
class Carro:
    def __init__(self, marca, modelo, ano):
        self.marca = marca
        self.modelo = modelo
        self.ano = ano

    def dirigir(self):
        return f"O {self.marca} {self.modelo} {self.ano} está em movimento"
carro1 = Carro("Toyota", "Corolla", 2020)
carro2 = Carro("Chevrolet", "Camaro", 2022)
carro3 = Carro("Tesla", "Model 3", 2021)

print(carro1.dirigir())   
print(carro2.dirigir())
print(carro3.dirigir())

# Fim do código.