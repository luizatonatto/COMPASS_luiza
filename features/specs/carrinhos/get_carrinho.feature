# language: pt

@regression
@post_carrinho
Funcionalidade: Get carrinhos
   Como uma aplicação xpto
   Gostaria de fazer requisições para APIs Rest
   Para poder consumir os seus serviços
   
@get_carrinho_200
Cenário: Realizar GET na rota /carrinhos/{_id} com id válido
   Dado possuir um id de carrinho "carrinho_id"
   Quando realizar uma chamada GET para a rota "/carrinhos" 
   Então validar que foi retornado o status code 200 e o schema "get_carrinho_200" 

@get_carrinhos_200
Cenário: Realizar GET na rota /carrinhos 
   Quando realizar uma chamada GET para a rota "/carrinhos" 
   Então validar que foi retornado o status code 200 e o schema "get_carrinhos_200" 

@get_carrinho_400
Cenário: Realizar GET na rota /carrinhos/{_id} com id inválido
   Dado possuir um id de carrinho "carrinho_invalido"
   Quando realizar uma chamada GET para a rota "/carrinhos" 
   Então validar que foi retornado o status code 400 e a mensagem "Carrinho não encontrado"