# Exemplo DE USO DE CLASSE EM PYTHON- Uso de __init__ e __str__

# Antes e depois do init são dois underlines (__)
# O método __init__ é chamado automaticamente quando a classe é instanciada
# O método __init__ é usado para inicializar os atributos do objeto
# O método __str__ é chamado quando o objeto é convertido para string
# O método __str__ é usado para definir a representação em string do objeto

class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

    def __str__(self):
        return f"Nome: {self.nome}, Idade: {self.idade}"
    
mc1 = Pessoa("João", 30)
print(mc1)  # Chama o método __str__
# Saída: Nome: João, Idade: 30
