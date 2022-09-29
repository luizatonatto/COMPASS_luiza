# language: pt

@regression
@post_carrinho
Funcionalidade: Post carrinhos
   Como uma aplicação xpto
   Gostaria de fazer requisições para APIs Rest
   Para poder consumir os seus serviços

@post_carrinho_400_nulo
Cenário: Cadastrar um produto de quantidade nula com POST na API Serverest
   Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
   E possuir um produto no carrinho com payload de quantidade nula
   Quando realizar uma chamada POST para a rota '/carrinhos'
   Então será exibida a mensagem de erro "Produto não possui quantidade suficiente"

@excluir_cart
@post_carrinho_200
Cenário: Cadastrar um produto no carrinho com POST na API Serverest
   Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
   E possuir um payload de produto no carrinho
   Quando realizar uma chamada POST para a rota '/carrinhos'
   Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"



