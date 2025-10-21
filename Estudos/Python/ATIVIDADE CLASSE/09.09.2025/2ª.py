# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 09 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 2. Crie uma classe Forma com o método area(). 
# Depois, crie duas classes filhas: 
    # ● Quadrado, que recebe o lado e calcula a área. 
    # ● Círculo, que recebe o raio e calcula a área . 
    # ● Crie uma função que recebe uma lista de formas geométricas e imprime a área de cada uma.

class Forma:
    def area(self):
        pass
   
class Quadrado(Forma):
    def __init__(self, lado):
        self.lado = lado    
    def area(self):
        return self.lado * self.lado    
    
class Circulo(Forma):
    def __init__(self, raio):
        self.raio = raio  
    def area(self):
        return 3.14 * (self.raio ** 2)
    
def imprimir_areas(formas):
    for forma in formas:
        print(f"Área: {forma.area():.2f}")

formas = [Quadrado(4), Circulo(3), Quadrado(5), Circulo(7)]
imprimir_areas(formas)

# Fim do código.