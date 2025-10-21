# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 5. Na classe Cachorro, adicione um método aniversario() que aumenta a idade em 1 e mostre o novo valor.

class Cachorro:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

    def latir(self):
        return f"{self.nome} está latindo!"

    def aniversario(self):
        self.idade += 1
        return f"Feliz aniversário, {self.nome}! Agora você tem {self.idade} anos."
# Exemplo de uso
meu_pet1 = Cachorro("Rex", 3)
meu_pet2 = Cachorro("Totó", 5)

print(meu_pet1.latir())
print(meu_pet2.aniversario())  
print(meu_pet1.latir())   
print(meu_pet1.aniversario()) 
print(meu_pet1.latir())   
print(meu_pet2.aniversario())
print(meu_pet1.latir())  
print(meu_pet2.latir())
# Fim do código.