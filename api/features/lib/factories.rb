require 'faker' 
require 'documentos_br'
require_relative '../models/empregado_models'

FactoryBot.define do
    factory :empregado, class: EmpregadosModels do
        admissao { "25/02/2020" }
        cargo {  "Desenvolvedor de Automação de Testes" }
        comissao {  "1.500,00" }
        cpf {  DocumentosBr.cpf_formatado }
        departamentoId {  1 }
        nome {  Faker::Name.first_name  }
        salario {  "5.000,00"  }
        sexo {  "m"  }
        tipoContratacao {  "clt" }
    end
end

FactoryBot.define do
    factory :put_empregado, class: EmpregadosModels do
        admissao { "25/02/2020" }
        cargo {  "Gerente de Projetos" }
        comissao {  "1.000,00" }
        cpf {  DocumentosBr.cpf_formatado.to_s }
        departamentoId {  246  }
        nome {  Faker::Name.first_name.to_s  }
        salario {  "10.000,00"  }
        sexo {  "m"  }
        tipoContratacao {  "clt" }
    end
end

