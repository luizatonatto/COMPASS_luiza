Dado("possuir um id de carrinho {string}") do |user_type|
    @id = Factory::Static.static_data(user_type)
end