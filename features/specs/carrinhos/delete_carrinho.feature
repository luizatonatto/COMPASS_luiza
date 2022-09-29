# language: pt

@regression
@delete_carrinho
Funcionalidade: Delete carrinhos
    Como uma aplicação xpto
    Gostaria de fazer requisições para APIs Rest
    Para poder consumir os seus serviços
    
@delete_carrinho_200
Cenário: [DELETE] Deletar um carrinho existente
   Dado possuir um novo carrinho cadastrado corretamente
   Quando realizar uma requisição DELETE para a rota "cancelar-compra"
   Então validar que foi retornado o status code 200 e a mensagem "Registro excluído com sucesso. Estoque dos produtos reabastecido"
