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

  def calcular_ipva(aliquota = 0.03)
    # Utiliza Redis para cachear os resultados
    redis = Redis.new

    cache_key = "fipe:#{@marca}:#{@modelo}:#{@ano}"
    valor_veiculo = redis.get(cache_key)

    unless valor_veiculo
      begin
        fipeapi = Fipeapi.new
        veiculo_fipe = fipeapi.find(@marca, @modelo, @ano)
        valor_veiculo = veiculo_fipe['Valor']
        redis.set(cache_key, valor_veiculo, ex: 3600) # Cache por 1 hora
      rescue Fipeapi::Error => e
        puts "Erro ao consultar a FIPE: #{e.message}"
        return nil
      end
    end
  end
end

class Carro < Veiculo
  attr_accessor :num_portas, :tipo_combustivel

end

class Caminhao < Veiculo
  attr_accessor :capacidade_carga, :num_eixos

  def custo_por_km(valor_combustivel)
  end
end
