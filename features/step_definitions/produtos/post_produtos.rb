Dado ('possuir um token de acesso setado para um usuário do tipo {string}') do |user_type|
    steps %{
        Dado possuir um payload de novo usuário do tipo "#{user_type}" para cadastrar
        Quando realizar uma chamada POST para a rota "/usuarios" 
        Então validar que foi criado um novo usuário
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
  
  Então('validar que um novo produto foi cadastrado com sucesso') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(201)
        expect(response_json['_id']).not_to be nil
        expect(response_json['message']).to eq('Cadastro realizado com sucesso')
   end
end

Dado('possuir um produto cadastrado') do
    steps %{
        Dado possuir um token de acesso setado para um usuário do tipo "usuario_admin"
        E possuir um payload de um produto válido
        Quando realizar uma chamada POST para a rota '/produtos'
        Então validar que um novo produto foi cadastrado com sucesso
    }
end
  
Dado('possuir payload com nome de um produto já cadastrado') do
    registered_product_name = @payload[:nome]
    @payload = Factory::Dynamic.new_valid_product
    @payload[:nome] = registered_product_name
end
  
  Então('validar que não foi possível cadastrar um produto com nome repetido') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(400)
        expect(response_json['message']).to eq('Já existe produto com esse nome')
    end
end


  Então ('validar que foi solicitado um token para o cadastro do produto') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(401)
        expect(response_json['message']).to eq('Token de acesso ausente, inválido, expirado ou usuário do token não existe mais')
   end
end

Então ('validar que usuários não administradores não podem cadastrar produtos') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(403)
        expect(response_json['message']).to eq('Rota exclusiva para administradores')
   end
end
        