
require 'colorize'

module PageInmetrics
  module Funcionario
    class Funcionario < SitePrism::Page
      set_url '/'

      element :div_form, '[class*="validate-form"]'
      element :div_table, '[id="tabela_wrapper"]'
      element :btn_enviar, '[class*="cadastrar"]'
      element :btn_novo_funcionario, 'li:nth-child(2)'
      element :input_cpf, '#cpf'
      element :input_nome, '#inputNome'
      element :input_cargo, '#inputCargo'
      element :input_search, '[type="search"]'
      element :input_salario, '#dinheiro'
      element :input_admissao, '#inputAdmissao'
      elements :select_sexo, '[id="slctSexo"] option'
      elements :select_contrato, '[type="radio"]'
      elements :btn_exclusao, '#delete-btn'
      elements :btn_edicao, '[class*="warning"]'
      elements :tbody_registros, 'tbody [role="row"]'

      def cadastrar_funcionario 
        insert = Factory.funcionario
        btn_novo_funcionario.click
        wait_until_div_form_visible
        input_nome.set insert[:nome]
        input_cargo.set insert[:cargo]
        input_cpf.send_keys insert[:cpf]
        input_salario.set insert[:salario]
        select_sexo[2].click
        select_contrato[rand(select_contrato.length)].click
        input_admissao.set insert[:admissao]
        btn_enviar.click 
        puts "\n Funcionário(a) #{insert[:nome]} cadastrado(a)".green if has_no_btn_enviar?
      end

      def editar_funcionario
        edit = Factory.funcionario
        if has_tbody_registros?
          nome = edit[:nome]
          btn_edicao.find { |editar| editar.click }
          wait_until_div_form_visible

          input_nome.set ''
          input_nome.set edit[:nome]

          input_cargo.set ''
          input_cargo.set edit[:cargo]

          input_salario.set ''
          input_salario.set edit[:salario]

          input_admissao.set ''
          input_admissao.set edit[:admissao]

          btn_enviar.click 
          puts "\n Funcionário(a) #{nome} editado(a)".green if has_div_table?
        else
          raise Exception.new "PÁGINA DE EDIÇÃO NÃO CARREGADA"
        end
      end

      def excluir_funcionario
        btn_exclusao.find { |excluir| excluir.click } if has_tbody_registros?
      end
    end
  end
end

