# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 23 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Associação, Agregação e Composição

# 1. Crie uma classe Carro que possui um Motor.  
# #  O Motor só faz sentido dentro do Carro.  
# #  Se o Carro deixar de existir, o Motor também deixa. 

class Motor:
    def __init__(self, potencia):
        self.potencia = potencia  # Potência do motor em cavalos

    def ligar(self):
        print(f"Motor de {self.potencia} cavalos ligado.")

    def desligar(self):
        print("Motor desligado.")  
# Composição: Motor faz sentido apenas dentro do Carro
class Carro:
    def __init__(self, modelo, potencia_motor):
        self.modelo = modelo  # Modelo do carro
        self.motor = Motor(potencia_motor)  # Composição: Carro possui um Motor

    def ligar_carro(self):
        print(f"Carro {self.modelo} está ligando.")
        self.motor.ligar()

    def desligar_carro(self):
        print(f"Carro {self.modelo} está desligando.")
        self.motor.desligar()

# Interações entre Carro e Motor
Motor1 = Motor(150)
Carro1 = Carro("Toyota Corolla", 180)
Carro1.ligar_carro()
Carro1.desligar_carro()