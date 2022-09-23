Class Utils
  def self.log_response(verb, endpoint, body)
        "Retorno da chamada com verbo #{verbo} para o endpoint #{endpoint}: \n #{body}" 
  end

  def self.get_schemas(schema)
        JSON.parse(File.read(%-#{Dir.pwd}/features/support/utils/schemas/#{schema}.json-))
  end
end

