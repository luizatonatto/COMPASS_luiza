Dado('possuir um payload para alterar o usuário cadastrado') do
  @nome_anterior = @payload[:nome]
  @payload[:nome] = 'batata'
end
  
Então('validar que o usuário foi alterado com sucesso') do
  step 'Então validar que foi retornado o status code 200 e a mensagem "Registro alterado com sucesso"'
   response_get = JSON.parse(@serverest_api.get(@endpoint).body)
   aggregate_failures do
      expect(response_get['nome']).not_to eq(@nome_anterior)
      expect(response_get['nome']).to eq('batata')
   end
end

