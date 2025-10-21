# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 04 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 6. Crie uma classe ContaBancaria com os atributos titular e saldo. Adicione métodos para depositar(valor) e sacar(valor).
# Garanta que o saldo não fique negativo.

class ContaBancaria:
    def __init__(self, titular, saldo=0):
        self.titular = titular
        self.saldo = saldo 
    def depositar(self, valor):
        if valor > 0:
            self.saldo += valor
            print(f"Depósito de R${valor:.2f} realizado com sucesso. Novo saldo: R${self.saldo:.2f}")
        else:
            print("O valor do depósito deve ser positivo.")
    def sacar(self, valor):
        if valor > 0:
            if valor <= self.saldo:
                self.saldo -= valor
                print(f"Saque de R${valor:.2f} realizado com sucesso. Novo saldo: R${self.saldo:.2f}")
            else:
                print("Saldo insuficiente para realizar o saque.")
        else:
            print("O valor do saque deve ser positivo.")
# Exemplo de uso
conta = ContaBancaria("Renato", 1000)
conta.depositar(500)  # Depósito de R$500.00 realizado com sucesso. Novo saldo: R$1500.00
conta.sacar(200)  # Saque de R$200.00 realizado com sucesso. Novo saldo: R$1300.00
conta.sacar(2000)  # Saldo insuficiente para realizar o saque.
conta.depositar(1000)  # Depósito de R$1000.00 realizado com sucesso. Novo saldo: R$2300.00
conta.sacar(-50)  # O valor do saque deve ser positivo.

#Fim do código.