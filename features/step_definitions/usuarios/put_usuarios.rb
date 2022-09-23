  Dado('possuir um payload para alterar o usuário cadastrado') do
    @nome_anterior = @payload[:nome]
    @payload[:nome] = 'batata'
  end
  
  Quando('realizar uma chamada PUT para a rota {string}') do |endpoint|
    @endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.put(@endpoint, @payload)
  end
  
Então('validar que o usuário foi alterado com sucesso') do
    @response_json = JSON.parse(@response.body)
    response_get = JSON.parse(@serverest_api.get(@endpoint).body)
    aggregate_failures do
        expect(@response.status).to eq(200)
        expect(@response_json['message']).to eq('Registro alterado com sucesso')
        expect(response_get['nome']).not_to eq(@nome_anterior)
        expect(response_get['nome']).to eq('batata')
    end
end
