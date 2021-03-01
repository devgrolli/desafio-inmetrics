module PageInmetrics
  class Pages
    class << self
      def login
        PageInmetrics::Login::Login.new
      end

      def cadastro
        PageInmetrics::Cadastro::Cadastro.new
      end

      def funcionario
        PageInmetrics::Funcionario::Funcionario.new
      end
    end
  end
end