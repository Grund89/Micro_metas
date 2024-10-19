# Desenvolver um sistema que simule uma empresa, com classes
# que herdam e compartilham funcionalidades.
# Exemplo: um sistema de gerenciamento de funcionários, onde
# Gerente e Funcionário têm comportamentos distintos.

class Pessoa
  attr_accessor :nome, :cpf

  def initialize(nome, cpf)
    @nome = nome
    @cpf = cpf
  end
end
