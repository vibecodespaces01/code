# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 09 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 1. Crie uma classe Animal com o método falar(). 
# Depois, crie as classes Cachorro e Gato que herdam de Animal e implementam falar() de forma diferente: 
    # ● O cachorro deve imprimir "Au au!" 
    # ● O gato deve imprimir "Miau!" 
    # ● Crie uma lista com vários animais e percorra a lista chamando falar() em cada um.

class Animal:
    def __init__(self, especie):
        self.especie = especie
    
    def falar(self):
        pass

class Cachorro(Animal):
    def falar(self):
        return "Au au!" 

class Gato(Animal):
    def falar(self):
        return "Miau!"

animais = [Cachorro("Cachorro"), Gato("Gato"), Cachorro("Cachorro"), Gato("Gato")]
for animal in animais:
    print(f"{animal.especie}: {animal.falar()}")

# Fim do código.