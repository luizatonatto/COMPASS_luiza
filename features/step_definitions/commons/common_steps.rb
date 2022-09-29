Quando('realizar uma chamada GET para a rota {string}') do |endpoint|
  endpoint = "#{endpoint}/#{@id}" unless @id.nil?
  @response = @serverest_api.get(endpoint)
  log Utils.log_response("GET", endpoint, @response.body)
end

Quando('realizar uma chamada POST para a rota {string}') do |endpoint|
  @response = @serverest_api.post(endpoint, @payload)
  log Utils.log_response("GET", endpoint, @response.body)
end

Quando('realizar uma chamada DELETE para a rota {string}') do |endpoint|
  endpoint = "#{endpoint}/#{@id}"
  @response = @serverest_api.delete(endpoint)
  log Utils.log_response("GET", endpoint, @response.body)
end

Quando('realizar uma chamada PUT para a rota {string}') do |endpoint|
  @endpoint = "#{endpoint}/#{@id}"
  @response = @serverest_api.put(@endpoint, @payload)
  log Utils.log_response("GET", endpoint, @response.body)
end

Então('validar que foi retornado o status code {int} e o schema {string}') do |status_code, schema_name|
  response_json = JSON.parse(@response.body)
  schema = Utils.get_schemas(schema_name)
  aggregate_failures do
    expect(JSON::Validator.validate!(schema, response_json)).to be true
    expect(@response.status).to eq(status_code)
  end
end

Então('validar que foi retornado o status code {int} e a mensagem {string}') do |status_code, message|
  @response_json = JSON.parse(@response.body)
  aggregate_failures do
      expect(@response.status).to eq(status_code)
      expect(@response_json['message']).to eq(message)
  end
end
