# language:pt

@cadastro @completo
Funcionalidade: Cadastro 
  Eu como usuário do sistema
  Quero realizar o cadastro  
  Para poder logar no sistema da Inmetrics

  Contexto:
    Dado que acesse a página de login
    E acessar a página de cadastro

  @cadastro_user
  Cenário: Realizar cadastro na aplicação
    Quando realizar o cadastro
    Então deverá redirecionar para a página de login

  @cadastro_exceptions
  Esquema do Cenário: Validar campos de exceção no cadastro de usuário
    Quando preencher os campos '<cadastro_exception>'
    Então deverá exibir a mensagem de erro '<mensagem>'

  Exemplos:
    | cadastro_exception       |    mensagem       |
    | cadastro_senha_diferente | senhas_diferentes |
    | cadastro_user_existente  | usuario_existente |