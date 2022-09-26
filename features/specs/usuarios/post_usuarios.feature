# language: pt

@regression
@post_usuarios
Funcionalidade: Post usuarios
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@post_usuario_201
Cenário: [POST] Cadastrar usuario com sucesso pela rota /usuarios
    Dado possuir um payload de novo usuário para cadastrar
    Quando realizar uma chamada POST para a rota "/usuarios" 
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    
@post_usuario_400
Cenário: [POST] Tentar cadastrar usuario com email já existente pela rota /usuarios
    Dado possuir um novo usuário cadastrado corretamente 
    Quando realizar uma chamada POST para a rota "/usuarios" 
    Então validar que foi retornado o status code 400 e a mensagem "Este email já está sendo usado"
    



