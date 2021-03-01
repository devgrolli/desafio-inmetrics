# language:pt

@login @completo
Funcionalidade: Login
  Eu como um usuário da aplicação
  Desejo realizar o login 
  Para que eu posso ter acesso ao gerenciamento dos funcionários

  Contexto:
    Dado que acesse a página de login

  @realizar_login
  Cenário: Realizar login
    Quando realizar login na aplicação 'login_default'
    Então o usuário deverá estar logado na aplicação

  @login_exception
  Cenário: Exceção de login
    Quando realizar login na aplicação 'login_erro'
    Então deverá exibir a mensagem de erro 'msg_login_erro'