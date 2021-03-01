Quando("realizo uma requisição GET para o serviço empregados") do
  @request_empregado = empregados.list_all_empregados
end

Então('o serviço Empregados deve responder com {int}') do |status_code|  
  expect(@request_empregado.code).to eq status_code
end  
  
Então("validar lista com todos os empregados cadastrados via API") do
  expect(@request_empregado.body).not_to be_empty
end

Quando("realizo uma requisição GET para o serviço Empregados passando id") do
  @id = empregados.split_ids
  @request_empregado = empregados.get_empregados_id(@id)
end

Quando("realizo uma requisição POST para o serviço Empregados") do
  @payload = build(:empregado).empregado_hash
  @request_empregado = empregados.post_empregados(@payload)
end

Então("validar o retorno do empregado solicitado pela API") do
  expect(@request_empregado.parsed_response['empregadoId']).to eql @id
end

Então("validar que o empregado foi cadastrado na API") do
  expect(@request_empregado['admissao']).to eql @payload[:admissao]
  expect(@request_empregado['cargo']).to eql @payload[:cargo]
  expect(@request_empregado['comissao']).to eql @payload[:comissao]
  expect(@request_empregado['cpf']).to eql @payload[:cpf]
  expect(@request_empregado['nome']).to eql @payload[:nome]
  expect(@request_empregado['salario']).to eql @payload[:salario]
  expect(@request_empregado['sexo']).to eql @payload[:sexo]
  expect(@request_empregado['tipoContratacao']).to eql @payload[:tipoContratacao]
end
    
Quando("realizo uma requisição PUT para o serviço Empregados") do
  step "realizo uma requisição POST para o serviço Empregados"
  step "o serviço Empregados deve responder com 202"
  step "validar que o empregado foi cadastrado na API"
  @body = build(:put_empregado).empregado_hash
  @request_empregado = empregados.put_empregados(@request_empregado['empregadoId'], @body)
end

Então("validar a alteração do empregado pela API") do
  expect(@request_empregado['admissao']).to eql @body[:admissao]
  expect(@request_empregado['cargo']).to eql @body[:cargo]
  expect(@request_empregado['comissao']).to eql @body[:comissao]
  expect(@request_empregado['cpf']).to eql @body[:cpf]
  expect(@request_empregado['nome']).to eql @body[:nome]
  expect(@request_empregado['salario']).to eql @body[:salario]
  expect(@request_empregado['sexo']).to eql @body[:sexo]
  expect(@request_empregado['tipoContratacao']).to eql @body[:tipoContratacao]
end

Quando("realizo uma requisição DELETE para o serviço Empregados") do
  @id_delete = empregados.split_ids
  @request_empregado = empregados.delete_empregados(@id_delete)
end

Então("validar que o empregado foi deletado") do
  expect(@request_empregado.body).to eql "Deletado"
end
