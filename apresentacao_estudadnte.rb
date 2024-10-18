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

  def apresentar
    super # Chama o método apresentar da classe pai
    puts "Sou estudante do curso de #{curso}."
  end

  # Criando objetos
  pessoa1 = Pessoa.new("João", 30)
  estudante1 = Estudante.new("Maria", 20, "Engenharia")

  # Chamando o método apresentar
  pessoa.apresentar
  estudante.apresentar
end
