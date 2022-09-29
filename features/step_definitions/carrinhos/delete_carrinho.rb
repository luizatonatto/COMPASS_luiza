Dado("possuir um novo carrinho cadastrado corretamente") do
    steps %{
    Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
    E possuir um payload de produto no carrinho
    Quando realizar uma chamada POST para a rota '/carrinhos'
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
  }
end

Dado("possuir um a rota de cancelamento {string}") do |user_type|
    @id = Factory::Static.static_data(user_type)
end