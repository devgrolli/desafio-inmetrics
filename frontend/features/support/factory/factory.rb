require 'faker'
require 'documentos_br'

class Factory

  def self.funcionario
    {
      nome: Faker::Name.first_name,
      cargo: Faker::Job.title,
      cpf: DocumentosBr.cpf_formatado, 
      salario: Faker::Number.number(digits: 7), 
      admissao: Faker::Date.backward(days: 14)
    }
  end
end