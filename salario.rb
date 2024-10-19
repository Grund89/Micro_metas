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

class Gerente < Empregado
  attr_accessor :bonus

  def initialize(nome, salario_base, bonus)
    super(nome, salario_base)
    @bonus = bonus
  end

  def calcular_salario
    salario_base + bonus
  end
end

# Criando objetos
empregado = Empregado.new("João", 2.000)
gerente = Gerente.new("Maria", 5.000, 1.000)

# Calculando e imprimindo os salários
puts "Salário de #{empregado.nome}: #{empregado.calcular_salario}"
puts "Salário de #{gerente.nome}: #{gerente.calcular_salario}"
