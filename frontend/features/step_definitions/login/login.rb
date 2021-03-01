Dado("que acesse a página de login") do
  @login = $page_inmetrics.login
  @login.load
end

Dado("acessar a página de cadastro") do 
  @login.acessar_page_cadastro
end

Quando("realizar login na aplicação {string}") do |login_default|
  @login.realizar_login(login_default)
end

Então("o usuário deverá estar logado na aplicação") do
  expect($page_inmetrics.funcionario).to have_div_table
end