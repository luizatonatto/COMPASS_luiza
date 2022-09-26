Dado ('possuir um token de acesso setado para um usuário do tipo {string}') do |user_type|
    steps %{
        Dado possuir um payload de novo usuário do tipo "#{user_type}" para cadastrar
        Quando realizar uma chamada POST para a rota "/usuarios" 
        Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    }
    @user_id = JSON.parse(@response.body)['_id']
    payload = { 'email': @payload[:email],
                'password':@payload[:password]
    }
    @serverest_api.set_access_token(payload)
end

Dado('possuir um payload de novo usuário do tipo {string} para cadastrar') do |user_type|
    @payload = Factory::Dynamic.new_valid_user(user_type)
end

Dado('possuir um payload de um produto válido') do
   @payload = Factory::Dynamic.new_valid_product
end

Dado('possuir um produto cadastrado') do
    steps %{
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
        E possuir um payload de um produto válido
        Quando realizar uma chamada POST para a rota '/produtos'
        Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    }
end
  
Dado('possuir payload com nome de um produto já cadastrado') do
    registered_product_name = @payload[:nome]
    @payload = Factory::Dynamic.new_valid_product
    @payload[:nome] = registered_product_name
end
