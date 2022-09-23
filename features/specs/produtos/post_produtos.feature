# language: pt
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
        Então validar que um novo produto foi cadastrado com sucesso
        
    @excluir_usuario
    @post_produtos_400
    Cenário: Tentar cadastrar um produto com nome já cadastrado
        Dado possuir um produto cadastrado
        E possuir payload com nome de um produto já cadastrado
        Quando realizar uma chamada POST para a rota '/produtos'
        Então validar que não foi possível cadastrar um produto com nome repetido

        @post_produtos_401
    Cenário: Cadastrar um produto com sucesso com POST na API Serverest
        Dado possuir um payload de um produto válido
        Quando realizar uma chamada POST para a rota '/produtos'
        Então validar que foi solicitado um token para o cadastro do produto


    @post_produtos_403
    Cenário: Tentar cadastrar um produto sem token de acesso com POST na API Serverest
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_nao_admin"
        E possuir um payload de um produto válido
        Quando realizar uma chamada POST para a rota '/produtos'
        Então validar que usuários não administradores não podem cadastrar produtos