# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 10. Crie uma classe Artista com um método apresentar() que imprime "Sou artista". 
# Crie uma classe Programador com um método apresentar() que imprime "Sou programador". 
# Depois crie uma classe PessoaMultiTalento que herda de ambas e veja qual método é chamado.

class Artista:
    def apresentar(self):
        print("Sou artista")    
class Programador:
    def apresentar(self):
        print("Sou programador")
class PessoaMultiTalento(Artista, Programador):
    pass    
pessoa = PessoaMultiTalento()
pessoa.apresentar()

# Fim do código.
