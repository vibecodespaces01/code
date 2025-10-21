# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 23 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Associação, Agregação e Composição

# 3. Crie uma classe Autor e uma classe Livro. 
# # Um autor pode escrever vários livros. 
# # Um livro tem apenas um autor. 
# # Os objetos devem ser capazes de interagir sem dependência total (um Autor pode existir sem Livro e vice-versa). 

class Autor:
    def __init__(self, nome):
        self.nome = nome  # Nome do autor

    def escrever(self):
        print(f"Autor {self.nome} está escrevendo um livro.")

class Livro:
    def __init__(self, titulo, autor):
        self.titulo = titulo  # Título do livro
        self.autor = autor  # Autor do livro (associação)

    def detalhes(self):
        print(f"Livro: {self.titulo}, Autor: {self.autor.nome}")
        
# Associação: Autor pode existir sem Livro e vice-versa

# Autores
autor1 = Autor("Machado de Assis")
autor2 = Autor("George Orwell")
autor3 = Autor("Aldous Huxley")

# Livros
livro1 = Livro("Dom Casmurro", autor1)
livro2 = Livro("Memórias Póstumas de Brás Cubas", autor1)
livro3 = Livro("O Alienista", Autor("Machado de Assis"))
livro4 = Livro("1984", Autor("George Orwell"))
livro5 = Livro("Animal Farm", autor2)    
livro6 = Livro("Homage to Catalonia", autor2)
livro7 = Livro("Brave New World", autor3)

# Interações entre Autor e Livro
livro1.detalhes()
livro2.detalhes()       
autor1.escrever()
livro3.detalhes()
livro3.autor.escrever() 
livro4.detalhes()
livro4.autor.escrever() 
livro5.detalhes()
autor2.escrever()   
livro6.detalhes()
autor2.escrever()
livro7.detalhes()
livro7.autor.escrever()