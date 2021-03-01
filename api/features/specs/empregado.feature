# language:pt
@empregados
Funcionalidade: Validar o crud de empregados atráves da API
  Como um usuário do sistema
  Desejo realizar requisições na API de Empregados
  Para validar o funcionamento das API

  @list_all_empregados
  Cenário: Validar listagem de todos os Empregados na API via GET
    Quando realizo uma requisição GET para o serviço empregados
    Então o serviço Empregados deve responder com 200
    E validar lista com todos os empregados cadastrados via API

  @list_empregado_id
  Cenário: Validar LIST API Empregado com id
    Quando realizo uma requisição GET para o serviço Empregados passando id
    Então o serviço Empregados deve responder com 202
    E validar o retorno do empregado solicitado pela API

  @post_empregado
  Cenário: Validar POST API Empregados
    Quando realizo uma requisição POST para o serviço Empregados
    Então o serviço Empregados deve responder com 202
    E validar que o empregado foi cadastrado na API

  @put_empregado
  Cenário: Validar PUT API Empregados
    Quando realizo uma requisição PUT para o serviço Empregados
    Então o serviço Empregados deve responder com 202
    E validar a alteração do empregado pela API

  @delete_empregado
  Cenário: Validar DELETE API Empregados
    Quando realizo uma requisição DELETE para o serviço Empregados
    Então o serviço Empregados deve responder com 202
    E validar que o empregado foi deletado  