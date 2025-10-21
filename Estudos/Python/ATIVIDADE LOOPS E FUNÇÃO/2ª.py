## Crie um programa que peça uma senha ao usuário e só termine quando a senha correta "python123" for digitada. 

## Define a senha correta
# senha_correta = "python123"

## Loop até que a senha correta seja digitada
# while True:
#    senha = input("Digite a senha: ")
#    if senha == senha_correta:
#       print("Senha correta! Acesso permitido.")
#        break
#    else:
#        print("Senha incorreta. Tente novamente.")

senha = ""
while senha != "python123":
    senha = input("Digite a senha: ")
print("Senha correta! Acesso permitido.")