# language: pt

@regression
@get_usuarios
Funcionalidade: Get usuários
   Como uma aplicação xpto
   Gostaria de fazer requisições para APIs Rest
   Para poder consumir os seus serviços
    
@get_usuarios_200
Cenário: Realizar GET na rota /usuarios da API de teste
   Quando realizar uma chamada GET para a rota "/usuarios" 
   Então validar que foi retornado o status code 200 e o schema "get_usuarios_200" 

@get_usuario_200
Cenário: Realizar GET na rota /usuarios/{_id} com id valido
   Dado possuir um id de usuário "usuario_valido"
   Quando realizar uma chamada GET para a rota "/usuarios" 
   Então validar que foi retornado o status code 200 e o schema "get_usuario_200" 

@get_usuarios_400
Cenário: Realizar GET na rota /usuarios/{_id} com id invalido
   Dado possuir um id de usuário "usuario_inexistente"
   Quando realizar uma chamada GET para a rota "/usuarios" 
   Então validar que foi retornado o status code 400 e o schema "get_usuario_400" 



