class Funcionario
  attr_accessor :nome, :salario

  def initialize(nome, salario)
    @nome = nome
    @salario = salario
  end

  def exibir_informacoes
    puts "Nome: #{@nome}, Salário: #{format('%.2f', @salario)}"
  end
end

class Gerente < Funcionario
  attr_accessor :equipe

  def initialize(nome, salario)
    super(nome, salario)
    @equipe = []
  end

  def adicionar_a_equipe(funcionario)
    @equipe << funcionario
  end

  def exibir_equipe
    puts "Equipe do gerente #{@nome}:"
    @equipe.each do |funcionario|
      funcionario.exibir_informacoes
    end
  end

  def ajustar_salario_da_equipe(porcentagem)
    @equipe.each do |funcionario|
      novo_salario = funcionario.salario * (1 + porcentagem / 100.0)
      funcionario.salario = novo_salario
      puts "Novo salário de #{funcionario.nome}: #{format('%.2f', funcionario.salario)}"
    end
  end
end

# Teste do sistema
funcionario1 = Funcionario.new("João", 3000)
funcionario2 = Funcionario.new("Maria", 3500)

gerente = Gerente.new("Carlos", 7000)

gerente.adicionar_a_equipe(funcionario1)
gerente.adicionar_a_equipe(funcionario2)

gerente.exibir_informacoes
gerente.exibir_equipe

# Ajusta o salário da equipe em 10%
gerente.ajustar_salario_da_equipe(10)
