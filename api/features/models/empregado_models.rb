class EmpregadosModels 
    attr_accessor :admissao, :cargo, :comissao, :cpf, :departamentoId, :nome, :salario, :sexo, :tipoContratacao

    def empregado_hash 
        {
            admissao: @admissao,
            cargo: @cargo,
            comissao: @comissao,
            cpf: @cpf, 
            departamentoId: @departamentoId, 
            nome: @nome,  
            salario: @salario,
            sexo: @sexo,
            tipoContratacao: @tipoContratacao
        }
    end
end
