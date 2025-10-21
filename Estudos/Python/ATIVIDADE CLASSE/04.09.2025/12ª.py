# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 12. Modele um sistema escolar simples: 
    # ● Classe Pessoa (nome, idade) 
    # ● Classe Aluno (herda de Pessoa, com matrícula e notas) 
    # ● Classe Professor (herda de Pessoa, com disciplina e salário) 
    # ● Crie métodos para cadastrar notas no aluno e calcular a média. 
    # ● Crie objetos de alunos e professores e exiba os dados formatados. 

class Pessoa:  
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

    def exibir_dados(self):
        return f"Nome: {self.nome}, Idade: {self.idade}"
class Aluno(Pessoa):
    def __init__(self, nome, idade, matricula):
        super().__init__(nome, idade)
        self.matricula = matricula
        self.notas = []

    def cadastrar_nota(self, nota):
        self.notas.append(nota)

    def calcular_media(self):
        if self.notas:
            return sum(self.notas) / len(self.notas)
        return 0

    def exibir_dados(self):
        dados_pessoa = super().exibir_dados()
        media = self.calcular_media()
        return f"{dados_pessoa}, Matrícula: {self.matricula}, Média: {media:.2f}"
class Professor(Pessoa):
    def __init__(self, nome, idade, disciplina, salario):
        super().__init__(nome, idade)
        self.disciplina = disciplina
        self.salario = salario

    def exibir_dados(self):
        dados_pessoa = super().exibir_dados()
        return f"{dados_pessoa}, Disciplina: {self.disciplina}, Salário: R${self.salario:.2f}"
# Criando objetos de Aluno e Professor
aluno1 = Aluno("Ana Silva", 20, "2023001")
aluno1.cadastrar_nota(8.5)
aluno1.cadastrar_nota(7.0)
aluno1.cadastrar_nota(9.0)

professor1 = Professor("Carlos Souza", 45, "Matemática", 3500.00)
# Exibindo os dados formatados
print(aluno1.exibir_dados())
print(professor1.exibir_dados())

# Fim do código.