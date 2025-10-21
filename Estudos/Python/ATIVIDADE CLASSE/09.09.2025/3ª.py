# Bolsa Futuro Digital- IFMA São José de Ribamar
# São José de Ribamar, 09 de Setembro de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade- Python

# 3. Crie uma classe Funcionario com um método salario(). 
# Depois crie duas subclasses: 
    # ● Gerente, que retorna 5000. 
    # ● Estagiario, que retorna 1500. 
    # ● Crie uma lista com funcionários diferentes e mostre o salário de cada um.

class Funcionario:
    def salario(self):
        pass    

class Gerente(Funcionario):
    def salario(self):
        return 5000 
    
class Estagiario(Funcionario):
    def salario(self):
        return 1500

funcionarios = [Gerente(), Estagiario(), Gerente(), Estagiario()]
for funcionario in funcionarios:
    print(f"Salário: R$ {funcionario.salario():.2f}")

# Fim do código.