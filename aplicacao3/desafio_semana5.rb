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
