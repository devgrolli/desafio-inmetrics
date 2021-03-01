Quando("realizar o cadastro") do
  @cadastro = $page_inmetrics.cadastro
  @cadastro.cadastrar_usuario
end

Então("deverá redirecionar para a página de login") do 
  expect($page_inmetrics.login).to have_div_title
end

Quando("preencher os campos {string}") do |cadastro_exception|
  @cadastro = $page_inmetrics.cadastro
  @cadastro.prencher_campos_exception(cadastro_exception)
end

Então("deverá exibir a mensagem de erro {string}") do |tipo|
  erro = Manager.get_mensg(tipo)
  expect(page).to have_content /#{erro[:mensagem]}/i
end