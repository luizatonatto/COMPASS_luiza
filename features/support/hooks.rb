Before do
    @serverest_api = ServeRest.new
end


After('@excluir_usuario') do
    @serverest_api.delete('/usuarios/' + @user_id)
end