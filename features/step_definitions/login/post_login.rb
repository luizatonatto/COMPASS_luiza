Dado('que tenha um usuário com email e senha em branco') do
  @payload = {
      "email": "",
      "password": ""
  }
end

Dado ('que tenha um usuário com email e senha válidos') do
  @payload = { 
    'email': @email["email"],
    'password': @senha["password"]
   }
end
  
Então('será exibida uma mensagem de erro') do
  response_json = JSON.parse(@response.body)
  aggregate_failures do
    expect(@response.status).to eql 400
    expect(response_json).to eql "message": "Email e/ou senha inválidos"
    end
end

Dado('que tenha um usuário com email inválido') do
  @payload = {
      "email": "naoexite@alala.com",
      "password": "123123413"
  }
end





