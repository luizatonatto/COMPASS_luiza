Dado('possuir um payload de novo usuário para cadastrar') do
    @payload = Factory::Dynamic.new_valid_user

end
  
  Então('validar que foi criado um novo usuário') do
    @response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(201)
        expect(@response_json['message']).not_to be nil
        expect(@response_json['_id']).not_to be nil
        expect(@response_json['message']).to eq('Cadastro realizado com sucesso')
    end
  end

  
  Então('validar que não foi possível criar um novo usuário') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(400)
        expect(response_json['message']).to eq('Este email já está sendo usado')
    end
  end

  Dado("possuir um novo usuário cadastrado corretamente") do
    steps %{
      Dado possuir um payload de novo usuário para cadastrar
      Quando realizar uma chamada POST para a rota "/usuarios" 
      Então validar que foi criado um novo usuário
    }  
    @id = @response_json["_id"]
  end