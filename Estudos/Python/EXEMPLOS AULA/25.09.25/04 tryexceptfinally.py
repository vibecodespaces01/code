# Exemplo de uso do bloco try-except-finally em Python


try:
    f = open("demofile.txt")
    try:
        f.write("Lorum Ipsum")
    except:
        print("Algo deu errado ao gravar no arquivo")
    finally:
        f.close()
except:
    print("Algo deu errado ao abrir o arquivo")
