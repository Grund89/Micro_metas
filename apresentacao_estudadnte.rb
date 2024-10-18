class Pessoa
  attr_accessor :nome, :idade

  def initialize(nome, idade)
    @nome = nome
    @idade = idade
  end

  def apresentar
    puts "Olá, meu nome é #{nome} e tenho #{idade} anos."
  end
end

class Estudante < Pessoa
  attr_accessor :curso

  def initialize(nome, idade, curso)
    super(nome, idade) # Chama o construtor da classe pai
    @curso = curso
  end
end
