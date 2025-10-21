# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 7. Crie uma classe Pessoa com atributos nome e idade. Depois crie uma classe Estudante que herda de Pessoa e adiciona matricula e curso.

class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade 
class Estudante(Pessoa):
    def __init__(self, nome, idade, matricula, curso):
        super().__init__(nome, idade)
        self.matricula = matricula
        self.curso = curso

    def mostrar_informacoes(self):
        return f"Nome: {self.nome}, Idade: {self.idade}, Matrícula: {self.matricula}, Curso: {self.curso}"
# Exemplo de uso
estudante1 = Estudante("Ana", 20, "2025001", "Engenharia")
estudante2 = Estudante("Bruno", 22, "2025002", "Medicina")
print(estudante1.mostrar_informacoes())
print(estudante2.mostrar_informacoes()) 

# Fim do código.