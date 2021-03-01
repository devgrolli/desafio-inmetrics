# language:pt
@funcionario @completo
Funcionalidade: Validar crud de Funcionário 
  Eu como usuário do sistema
  Quero realizar o login 
  Para poder gerenciar os funcionários do sistema

  Contexto:
    Dado que acesse a página de login
    E realizar login na aplicação 'login_default'

  @cadastrar_funcionario
  Cenário: Cadastrar um novo funcionário
    Quando cadastrar novo funcionario
    Então deverá exibir mensagem de sucesso ao cadastrar 'funcionario_cadastrado'

  @editar_funcionario
  Cenário: Editar um funcionário
    Quando editar um funcionario
    Então deverá exibir mensagem de sucesso ao cadastrar 'funcionario_editado'

  @excluir_funcionario
  Cenário: Excluir um funcionário
    Quando excluir um funcionario
    Então deverá exibir mensagem de sucesso ao cadastrar 'funcionario_excluido'  