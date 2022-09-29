Dado('possuir um produto no carrinho com payload de quantidade nula') do
    @payload = Factory::Dynamic.carrinho_nulo
end

Dado('possuir um payload de produto no carrinho') do
    @payload = Factory::Dynamic.new_valid_cart
    @id_cart = @response_json["_id"]
end
  
Então('será exibida a mensagem de erro {string}') do |message|
    response_json = JSON.parse(@response.body)
    aggregate_failures do
      expect(@response.status).to eql 400
      expect(response_json).to eql(message)
    end
end

