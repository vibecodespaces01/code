# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 9. Crie uma classe Professor que herda de Funcionario e adiciona a propriedade disciplina. Crie um método que exiba "Professor X leciona Y".

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
class Professor(Funcionario):
    def __init__(self, nome, idade, salario, disciplina):
        super().__init__(nome, idade, salario)
        self.disciplina = disciplina
    def exibir_leciona(self):
        return f"Professor {self.nome} leciona {self.disciplina}."
# Exemplo de uso
professor = Professor("Renato", 30, 3000, "Matemática")
funcionario = Funcionario("Ana", 28, 2500)
print(professor.apresentar())  # Saída: Olá, meu nome é Renato e tenho 30 anos.
print(f"O 13º salário é: R$ {professor.calcular_13_salario():.2f}")  # Saída: O 13º salário é: R$ 3000.00
print(professor.exibir_leciona())  # Saída: Professor Renato leciona Matemática. salário é: R$ 3000.00
print(funcionario.calcular_13_salario())  # Saída: O 13º    

# Fim do código.