# Criar uma aplicação que utilize herança e polimorfismo.
# Desenvolver uma aplicação que utilize herança entre classes
# e aplique polimorfismo para sobrescrever métodos, como um sistema
# de gerenciamento de veículos (Carro, Caminhão).

require 'fipe_api'
require 'redis'
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

class Carro < Veiculo
  attr_accessor :num_portas, :tipo_combustivel

  def calcular_ipva(aliquota = 0.03)
    redis = Redis.new
  end
end
