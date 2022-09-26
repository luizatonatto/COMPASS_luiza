# language: pt

@regression
@put_usuarios
Funcionalidade: Put usuarios
    Como uma aplicação xpto
    Gostatiaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@put_usuario_200
Cenário: [PUT] Atualizar um novo usuário com sucesso utilizando PUT na rota "/usuario"
    Dado possuir um novo usuário cadastrado corretamente 
    E possuir um payload para alterar o usuário cadastrado
    Quando realizar uma chamada PUT para a rota "/usuarios" 
    Então validar que foi retornado o status code 200 e a mensagem "Registro alterado com sucesso"

@put_usuario_201
Cenário: [PUT] Criar um novo usuário através do PUT
    Dado possuir um payload de novo usuário para cadastrar
    E possuir um id de usuário "usuario_inexistente"
    Quando realizar uma chamada PUT para a rota "/usuarios" 
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    

@put_usuario_400
Cenário: [PUT] Validar que não é possível criar um novo usuário com e-mail já existente 
    Dado possuir um novo usuário cadastrado corretamente 
    E possuir um id de usuário "usuario_inexistente"
    Quando realizar uma chamada PUT para a rota "/usuarios" 
    Então validar que foi retornado o status code 400 e a mensagem "Este email já está sendo usado"