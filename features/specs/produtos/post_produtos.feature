# language: pt

@regression
@post_produtos
Funcionalidade: Post produtos
    Como uma aplicação xpto
    Gostaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços

@excluir_usuario
@post_produtos_201
Cenário: Cadastrar um produto com sucesso com POST na API Serverest
    Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
    E possuir um payload de um produto válido
    Quando realizar uma chamada POST para a rota '/produtos'
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"

@excluir_usuario
@post_produtos_400
Cenário: Tentar cadastrar um produto com nome já cadastrado
    Dado possuir um produto cadastrado
    E possuir payload com nome de um produto já cadastrado
    Quando realizar uma chamada POST para a rota '/produtos'
    Então validar que foi retornado o status code 400 e a mensagem "Já existe produto com esse nome"

@post_produtos_401
Cenário: Cadastrar um produto com sucesso com POST na API Serverest
    Dado possuir um payload de um produto válido
    Quando realizar uma chamada POST para a rota '/produtos'
    Então validar que foi retornado o status code 401 e a mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

@post_produtos_403
Cenário: Tentar cadastrar um produto sem token de acesso com POST na API Serverest
    Dado possuir um token de acesso setado para um usuário do tipo "usuario_nao_admin"
    E possuir um payload de um produto válido
    Quando realizar uma chamada POST para a rota '/produtos'
    Então validar que foi retornado o status code 403 e a mensagem "Rota exclusiva para administradores"
