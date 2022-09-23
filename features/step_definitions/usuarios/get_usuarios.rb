
  #Então('validar que foram retornados usuários') do
    #response_json = JSON.parse(@response.body)
    #aggregate_failures do
      #expect(@response.status).to eq(200)
      #expect(response_json['quantidade']).to be > 0
      #expect(response_json['usuarios'].size).to be > 1
      #expect(response_json['usuarios'].class).to be_kind_of(Array.class)
      #expect(response_json['quantidade'].class).to be_kind_of(Integer.class)
    #end
  #end
    

  Dado("possuir um id de usuário {string}") do |user_type|
    @id = Factory::Static.static_data(user_type)
  end
  
  Então('validar que foi retornado o status code {int} e o schema {string}') do |status_code, schema_name|
    response_json = JSON.parse(@response.body)
    schema = Utils.get_schemas(schema_name)
    aggregate_failures do
      expect(JSON::Validator.validate!(schema, response_json)).to be true
      expect(@response.status).to eq(status_code)

      #expect(response_json['nome']).to be nil
      #expect(response_json['email']).to be nil
      #expect(response_json['password']).to be nil
      #expect(response_json['administrador']).to be nil
      #expect(response_json['_id']).to be nil
    end
  end

  #Então('validar que não foi retornado o usuário') do
    #response_json = JSON.parse(@response.body)
    #aggregate_failures do
      #expect(@response.status).to eq(400)
      #expect(response_json['message']).to eq('Usuário não encontrado')
    #end
  #end
  






  