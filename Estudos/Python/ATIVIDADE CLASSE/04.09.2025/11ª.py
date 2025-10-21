# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 11.Use super() em todas as classes do exercício anterior para que os métodos sejam chamados em cadeia, seguindo a MRO.

class Artista:
    def apresentar(self):
        print("Sou artista")
        super().apresentar()
class Programador:  
    def apresentar(self):
        print("Sou programador")
        super().apresentar()
class PessoaMultiTalento(Artista, Programador):
    def apresentar(self):
        print("Sou uma pessoa multitarefa")
        super().apresentar()
pessoa = PessoaMultiTalento()
pessoa.apresentar() 

# Fim do código.