class Manager
  def initialize
    open()
  end

  def self.get_login(tag) 
    login = $login_manager.find { |login| login[:tag].index(/#{tag}/i) != nil }
    login
  end

  def self.get_cadastro(tag) 
    cadastro = $cadastro_manager.find { |cadastro| cadastro[:tag].index(/#{tag}/i) != nil }
    cadastro
  end

  def self.get_mensg(tag) 
    mensagem = $mensagem_manager.find { |mensagem| mensagem[:tag].index(/#{tag}/i) != nil }
    mensagem
  end
end