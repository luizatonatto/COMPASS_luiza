module Factory
    class Dynamic
        def self.new_valid_user(user_type = nil)
           payload ={
                "nome": Faker::Name.name,
                "email": Faker::Internet.email,
                "password": "teste",
                "administrador": "true",
            }
            return payload if user_type.nil?

            if user_type == 'usuario_admin'
                payload[:administrador] = 'true'
            elsif user_type == 'usuario_nao_admin'
                payload[:administrador] = 'false'
            end
            payload         
        end
        
        def self.invalid_user
            @id = "invalido"
          
        end

        def self.new_valid_product
            {
                "nome": Faker::Movie.title,
                "preco": 470,
                "descricao": "good watch",
                "quantidade": "381",
            }
        end

        def self.carrinho_nulo
            {
                "produtos": [
                  {
                    "idProduto": "BeeJh5lz3k6kSIzA",
                    "quantidade": 0
                  }
                ]
            }
        end

        def self.new_valid_cart
            {
                "produtos": [
                  {
                    "idProduto": "BeeJh5lz3k6kSIzA",
                    "quantidade": 1
                  }
                ]
            }  
        end

        def self.login_valid_user
            payload ={
                 "nome": Faker::Name.name,
                 "email": Faker::Internet.email,
                 "password": "teste",
                 "administrador": "true",
             }
        end
    end
end 
