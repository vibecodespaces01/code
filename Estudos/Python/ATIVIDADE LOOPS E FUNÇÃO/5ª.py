# Inicializa a variável para armazenar o maior número
maior = None

# Loop para ler 5 números
for i in range(5):
    numero = int(input(f"Digite o {i+1}º número: "))
    
    if maior is None or numero > maior:
        maior = numero

# Exibe o maior número
print(f"O maior número digitado foi: {maior}")
