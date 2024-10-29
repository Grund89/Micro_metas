# Criar uma aplicação que utilize herança e polimorfismo.
# Desenvolver uma aplicação que utilize herança entre classes
# e aplique polimorfismo para sobrescrever métodos, como um sistema
# de gerenciamento de veículos (Carro, Caminhão).


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
