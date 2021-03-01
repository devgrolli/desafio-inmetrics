
module PageInmetrics
  module Login
    class Login < SitePrism::Page
      set_url '/'

      element :div_title, 'span[class*="title"]'
      element :btn_cadastre_se, 'a[class*="tx"]'
      element :input_user, '[name="username"]'
      element :input_password, '[type="password"]'
      element :btn_entrar, 'button[class*="btn"]'

      def acessar_page_cadastro
        wait_until_btn_cadastre_se_visible
        btn_cadastre_se.click
      end

      def realizar_login(login)
        dados = Manager.get_login(login)
        input_user.set dados[:email]
        input_password.set dados[:senha]
        btn_entrar.click 
      end
    end
  end
end