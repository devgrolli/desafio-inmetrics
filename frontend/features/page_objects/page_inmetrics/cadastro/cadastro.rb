require 'faker'
module PageInmetrics
  module Cadastro
    class Cadastro < SitePrism::Page
      set_url '/'

      element :input_user, '[name="username"]'
      element :button_cadastrar, 'button[class*="btn"]'
      elements :input_password, '[type="password"]'
      elements :alerts_inputs, '[class*="alert-validate"]'

      def cadastrar_usuario
        senha = Faker::Number.number(digits: 6)
        input_user.set 'inmetrics_'+Faker::Internet.email
        input_password.each { |insert| insert.set senha }
        button_cadastrar.click
      end

      def prencher_campos_exception(tipo)
        dados = Manager.get_cadastro(tipo)
        input_user.set dados[:email]
        input_password[0].set dados[:senha1] 
        input_password[1].set dados[:senha2] 
        button_cadastrar.click
      end
    end
  end
end