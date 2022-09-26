# language: pt

@regression
@delete_usuarios
Funcionalidade: Delete usuários
    Como uma aplicação xpto
    Gostaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@delete_usuario_200_OK
Cenário: [DELETE] Deletar um usuário existente
   Dado possuir um novo usuário cadastrado corretamente
   Quando realizar uma chamada DELETE para a rota "/usuarios" 
   Então validar que foi retornado o status code 200 e a mensagem "Registro excluído com sucesso"

@delete_usuario_200_nok
Cenário:[DELETE] Tentar excluir um usuário que não existe
    Dado possuir um id de usuário "usuario_inexistente"
    Quando realizar uma chamada DELETE para a rota "/usuarios" 
    Então validar que foi retornado o status code 200 e a mensagem "Nenhum registro excluído"


