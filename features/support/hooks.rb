Before do
    @serverest_api = ServeRest.new
end


After('@excluir_usuario') do
    @serverest_api.delete('/usuarios/' + @user_id)
end

After('@excluir_produto') do
    @serverest_api.delete('/produtos/' + @product_id)
end

After('@excluir_cart') do
    @serverest_api.delete('/carrinhos/' + @id_cart)
end

