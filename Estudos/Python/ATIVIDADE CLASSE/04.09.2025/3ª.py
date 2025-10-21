# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 3.Crie uma classe chamada Livro com atributos titulo, autor e ano. Instancie três livros diferentes e mostre suas informações. 

class Livro:
    def __init__(self, titulo, autor, ano):
        self.titulo = titulo
        self.autor = autor
        self.ano = ano

    def mostrar_informacoes(self):
        return f"Título: {self.titulo}, Autor: {self.autor}, Ano: {self.ano}"  
livro1 = Livro("2041", "Kay-Fu Lee", 2022)
livro2 = Livro("O Senhor dos Anéis", "J.R.R. Tolkien", 1954)
livro3 = Livro("Dom Casmurro", "Machado de Assis", 1899)
print(livro1.mostrar_informacoes())
print(livro2.mostrar_informacoes())
print(livro3.mostrar_informacoes())

# Fim do código.