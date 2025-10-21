# Exemplo DE USO DE CLASSE EM PYTHON- Imprimindo atributos

# Antes e depois do init são dois underlines (__)
# O método __init__ é chamado automaticamente quando a classe é instanciada
# O método __init__ é usado para inicializar os atributos do objeto

class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

    def minhafuncao(self):
        print("Olá, meu nome é", self.nome, "e tenho", self.idade, "anos.")

mc1 = Pessoa("João", 36)
mc1.minhafuncao()

