Dado('possuir um payload de novo usuário para cadastrar') do
  @payload = Factory::Dynamic.new_valid_user
  @email = @response_json["email"]
  @senha = @response_json["password"]
end

  Dado("possuir um novo usuário cadastrado corretamente") do
  steps %{
    Dado possuir um payload de novo usuário para cadastrar
    Quando realizar uma chamada POST para a rota "/usuarios" 
    Então validar que foi retornado o status code 201 e a mensagem "Cadastro realizado com sucesso"
    }  
    @id = @response_json["_id"]
  end

