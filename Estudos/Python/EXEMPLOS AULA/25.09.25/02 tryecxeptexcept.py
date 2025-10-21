# Exemplo de uso do bloco try-except-except em Python

try:
    print(x)
except NameError:
    print("Variável x não está definida.")
except:
    print("Outra coisa deu errado.")