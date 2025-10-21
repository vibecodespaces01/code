# Bolsa Futuro Digital
# São José de Ribamar, 18 de setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# ATIVIDADE - Abstração 

# Sistema de Pagamentos 

# Você foi contratado para desenvolver um sistema de pagamentos para uma loja online. O sistema deve atender aos seguintes requisitos: 
# 1. Todo pagamento deve ter um valor e um método obrigatório processar_pagamento(). 
# ○ Isso deve ser definido em uma classe abstrata chamada Pagamento. 

# 2. A loja deve aceitar diferentes formas de pagamento (Cartão de Crédito, Pix e Boleto). 
# ○ Cada classe filha deve implementar o método abstrato processar_pagamento() de acordo com sua forma de pagamento. 

# 3. Para garantir que qualquer forma de pagamento possa ser cancelada, crie uma interface Cancelavel que tenha o método abstrato cancelar_pagamento(). 
# ○ Todas as classes de pagamento devem implementar essa interface. 

from abc import ABC, abstractmethod

class Pagamento(ABC):
    def __init__(self, valor):
        self.valor = valor

    @abstractmethod
    def processar_pagamento(self):
        pass
    @abstractmethod
    def cancelar_pagamento(self):
        pass
        
class CartaoCredito(Pagamento):
    def processar_pagamento(self):
        return f"Processando pagamento de R${self.valor} via Cartão de Crédito."

    def cancelar_pagamento(self):
        return "Pagamento via Cartão de Crédito cancelado."

class Pix(Pagamento):
    def processar_pagamento(self):
        return f"Processando pagamento de R${self.valor} via Pix."

    def cancelar_pagamento(self):
        return "Pagamento via Pix cancelado."
class Boleto(Pagamento):
    def processar_pagamento(self):
        return f"Processando pagamento de R${self.valor} via Boleto."

    def cancelar_pagamento(self):
        return "Pagamento via Boleto cancelado."
    

# Exemplo de uso
pagamento_cartao = CartaoCredito(150.00)
print(pagamento_cartao.processar_pagamento())
print(pagamento_cartao.cancelar_pagamento())

pagamento_pix = Pix(200.00)
print(pagamento_pix.processar_pagamento())      
print(pagamento_pix.cancelar_pagamento())

pagamento_boleto = Boleto(100.00)
print(pagamento_boleto.processar_pagamento())
print(pagamento_boleto.cancelar_pagamento())

# Fim do código.