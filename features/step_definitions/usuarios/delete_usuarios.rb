Então('validar que o usuário foi excluído com sucesso') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(200)
        expect(response_json['message']).to eq('Registro excluído com sucesso')
    end
end
  
Então('validar que não é possível excluir um usuário inexistente') do
    response_json = JSON.parse(@response.body)
    aggregate_failures do
        expect(@response.status).to eq(200)
        expect(response_json['message']).to eq('Nenhum registro excluído')
    end
end