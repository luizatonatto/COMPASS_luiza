# language: pt

@regression
@login
Funcionalidade: Login usuários
   Como uma aplicação xpto
   Gostaria de fazer requisições para APIs Rest
   Para poder consumir os seus serviços

@login_200
Cenário: Login com email e senha válidos
   Dado que tenha um usuário com email e senha válidos
   Quando realizar uma chamada POST para a rota "/login"
   Então validar que foi retornado o status code 200 e a mensagem "Login realizado com sucesso"

@login_branco
Cenário: Login com email e senha em branco
   Dado que tenha um usuário com email e senha em branco
   Quando realizar uma chamada POST para a rota "/login"
   Então será exibida uma mensagem de erro

@login_invalido
Cenario: Login com email inválido
   Dado que tenha um usuário com email inválido
   Quando realizar uma chamada POST para a rota "/login"
   Então validar que foi retornado o status code 400 e a mensagem "Email e/ou senha inválidos"

