  Quando('realizar uma chamada GET para a rota {string}') do |path|
      endpoint = "#{endpoint}/#{@id}" unless @id.nil?
      @response = @serverest_api.get(path)
      log Utils.log_response("GET", endpoint, @response.body)
  end

  Quando('realizar uma chamada POST para a rota {string}') do |endpoint|
    @response = @serverest_api.post(endpoint, @payload)
  end

  Quando('realizar uma chamada DELETE para a rota {string}') do |endpoint|
    endpoint = "#{endpoint}/#{@id}"
    @response = @serverest_api.delete(endpoint)
  end