# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 8. Crie uma classe Funcionario que herda de Pessoa e adiciona salario. Crie um método que calcula o 13º salário (um salário extra).

class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade 
    def apresentar(self):
        return f"Olá, meu nome é {self.nome} e tenho {self.idade} anos."   
class Funcionario(Pessoa):
    def __init__(self, nome, idade, salario):
        super().__init__(nome, idade)
        self.salario = salario
    def calcular_13_salario(self):
        return self.salario
# Exemplo de uso
funcionario = Funcionario("Renato", 30, 3000)
print(funcionario.apresentar())  # Saída: Olá, meu nome é Renato e tenho 30 anos.
print(f"O 13º salário é: R$ {funcionario.calcular_13_salario():.2f}")  # Saída: O 13º

# Fim do código.