Quando("cadastrar novo funcionario") do
  @funcionario = $page_inmetrics.funcionario
  @funcionario.cadastrar_funcionario
end

Quando("editar um funcionario") do
  @funcionario = $page_inmetrics.funcionario
  @funcionario.editar_funcionario
end

Quando("excluir um funcionario") do
  @funcionario = $page_inmetrics.funcionario
  @funcionario.excluir_funcionario
end
  
Então("deverá exibir mensagem de sucesso ao cadastrar {string}") do |msg_alert|
  msg = Manager.get_mensg(msg_alert)
  expect(page).to have_content /#{msg[:mensagem]}/i
end