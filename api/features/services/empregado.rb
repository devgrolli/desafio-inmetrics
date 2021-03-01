module REST
  class Empregados
    include HTTParty 

    headers ({
      'Content-Type' => 'application/json', 
      'Authorization' => 'Basic aW5tZXRyaWNzOmF1dG9tYWNhbw=='
    })
    base_uri CONFIG['base_uri']

    def list_all_empregados
      self.class.get('/empregado/list_all')
    end

    def get_empregados_id(id)
      self.class.get("/empregado/list/#{id}")
    end

    def post_empregados(empregado)
      self.class.post('/empregado/cadastrar', body: empregado.to_json)
    end

    def put_empregados(empregadoId, put_empregado)
      self.class.put("/empregado/alterar/#{empregadoId}", body: put_empregado.to_json)
    end

    def delete_empregados(empregadoId)
      self.class.delete("/empregado/deletar/#{empregadoId}")
    end

    def split_ids 
      array = Array.new
      list_all_empregados.each { |key| array.push(key["empregadoId"]) } 
      id = array[rand(array.count)]
      return id
    end
  end
end
