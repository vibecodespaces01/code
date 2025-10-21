# Exemplo DE USO DE CLASSE EM PYTHON- Imprimindo nome
# Antes e depois do init são dois underlines (__)
# O método __init__ é chamado automaticamente quando a classe é instanciada
# O método __init__ é usado para inicializar os atributos do objeto 

class Pessoa:
    def __init__(self, nome, sobrenome):
        self.primeironome = nome
        self.sobrenome = sobrenome
    def printnome(self):
        print("Olá, meu nome é", self.primeironome, self.sobrenome)

mc1 = Pessoa("Renato", "Oliveira")
mc1.printnome()

