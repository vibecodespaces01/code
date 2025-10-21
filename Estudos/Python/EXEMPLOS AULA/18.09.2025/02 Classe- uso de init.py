# Exemplo DE USO DE CLASSE EM PYTHON- Uso de __init__

# Antes e depois do init são dois underlines (__)
# O método __init__ é chamado automaticamente quando a classe é instanciada
# O método __init__ é usado para inicializar os atributos do objeto

class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

mc1 = Pessoa("João", 30)
print(mc1.nome)
print(mc1.idade)
# Saída: João
# Saída: 30

