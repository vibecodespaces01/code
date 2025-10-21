# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 09 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 4. Crie uma classe Veiculo com o método mover(). 
# Depois crie: 
    # ● Carro, que imprime "Dirigindo...". 
    # ● Bicicleta, que imprime "Pedalando...". 
    # ● Avião, que imprime "Voando...". 
    # ● Faça um programa que receba uma lista de veículos e use um loop para chamar o método mover() de cada um.

class Veiculo:
    def mover(self):
        pass

class Carro(Veiculo):
    def mover(self):
        return "Dirigindo..."
    
class Bicicleta(Veiculo):
    def mover(self):
        return "Pedalando..."
    
class Aviao(Veiculo):
    def mover(self):
        return "Voando..."

veiculos = [Carro(), Bicicleta(), Aviao(), Carro(), Bicicleta()]
for veiculo in veiculos:
    print(veiculo.mover())
    
# Fim do código.