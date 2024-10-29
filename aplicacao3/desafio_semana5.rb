# Herança em OOP: criar uma classe que herda de outra.
# Aprender o conceito de herança em OOP, criando uma classe filha
# que herda atributos e métodos da classe pai.
# Exemplo: Estudante herdando de Pessoa.

class Veiculo
  attr_accessor :marca, :modelo, :ano

  def initialize(marca, modelo, ano)
    @marca = marca
    @modelo = modelo
    @ano = ano
  end


  def idade
    ano_atual = Time.now.year
    ano_atual - @ano
  end
end
