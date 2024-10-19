class Empregado
  attr_accessor :nome, :salario_base

  def initialize(nome, salario_base)
    @nome = nome
    @salario_base = salario_base
  end

  def calcular_salario
    salario_base
  end
end
