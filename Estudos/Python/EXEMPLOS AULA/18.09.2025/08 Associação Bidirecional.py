# Associação Bidirecional em Python
# Neste exemplo, um Pedido está associado a um Cliente, e o Cliente conhece seus Pedidos.

class Pedido:
    def __init__(self, numero, cliente):
        self.numero = numero
        self.cliente = cliente  # Associação: Pedido "tem" um cliente
        self.cliente.adicionar_pedido(self)  # Pedido informa ao cliente que ele foi criado

    def __str__(self):
        return f"Pedido {self.numero} para o cliente {self.cliente.nome}"

class Cliente:
    def __init__(self, nome):
        self.nome = nome
        self.pedidos = []  # Associação: Cliente "tem" uma lista de Pedidos

    def adicionar_pedido(self, pedido):
        self.pedidos.append(pedido)

    def mostrar_pedidos(self):
        print(f"Pedidos do cliente {self.nome}:")
        for pedido in self.pedidos:
            print(f" - {pedido.numero}")

# Criamos um cliente
cliente1 = Cliente("Carlos Ronaldo")
cleinte2 = Cliente("Ana Maria")

# Criamos alguns pedidos, passando o cliente como referência
pedido1 = Pedido("001", cliente1)
pedido2 = Pedido("002", cliente1)
pedido3 = Pedido("003", cleinte2)

# Ambas as classes conhecem o autor
# O objeto Pedido tem uma referência ao objeto Cliente
print(f"O objeto Pedido {pedido1.numero} está associado ao cliente: {pedido1.cliente.nome}")
print(f"O objeto Pedido {pedido2.numero} está associado ao cliente: {pedido2.cliente.nome}")
print(f"O objeto Pedido {pedido3.numero} está associado ao cliente: {pedido3.cliente.nome}")

# O objeto Cliente tem uma lista de referências aos pedidos
cliente1.mostrar_pedidos()
cleinte2.mostrar_pedidos()

