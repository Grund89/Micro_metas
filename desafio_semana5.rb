class Veiculo
  attr_accessor :marca, :modelo, :ano, :capacidade_de_combustivel

  def initialize(marca, modelo, ano, capacidade_de_combustivel)
    @marca = marca
    @modelo = modelo
    @ano = ano
    @capacidade_de_combustivel = capacidade_de_combustivel
  end
