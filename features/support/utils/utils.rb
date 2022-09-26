class Utils
  def self.log_response(verb, endpoint, body)
        "Retorno da chamada com verbo #{verb} para o endpoint #{endpoint}: \n #{body.force_encoding('UTF-8')}" 
  end

  def self.get_schemas(schema)
        JSON.parse(File.read(%-#{Dir.pwd}/features/support/utils/schemas/#{schema}.json-))
  end
end

