# Bolsa Futuro Digital
# São José de Ribamar, 31 de agosto de 2025.
# Discente: Renato da Fonseca Oliveira

# Atividade Avaliativa - Python

    # 8. Crie uma função chamada busca_preco que receba um dicionário de produtos e preços, 
    # de um produto específico, retornando o preço ou a mensagem "Produto não encontrado". 
        # ● Mostre os resultados usando f-string e format(). 

def busca_preco(produtos, produto_buscado):
    if produto_buscado in produtos:
        return f"O preço do {produto_buscado} é R$ {produtos[produto_buscado]:.2f}"
    else:
        return "Produto não encontrado"
# Exemplo de uso
produtos = {
    "maçã": 3.50,
    "banana": 2.00,
    "laranja": 4.00
}
produto_buscado = "banana"
resultado = busca_preco(produtos, produto_buscado)
print(resultado)  # Usando f-string
print("O preço do {} é R$ {:.2f}".format(produto_buscado, produtos.get(produto_buscado, 0)))  # Usando format()
# Se o produto não for encontrado, a segunda linha mostrará "O preço do banana é R$ 0.00"

