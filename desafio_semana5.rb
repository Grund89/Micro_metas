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
        valor_veiculo = veiculo_fipe['Valor'].to_f
        redis.set(cache_key, valor_veiculo, ex: 3600) # Cache por 1 hora
      rescue Fipeapi::Error => e
        puts "Erro ao consultar a FIPE: #{e.message}"
        return nil
      end
    end

    ipva = valor_veiculo * aliquota
    return ipva
  end
end

class Carro < Veiculo
  attr_accessor :num_portas, :tipo_combustivel
end



# Pedindo informações ao usuário
puts "Informe os dados do veículo:"
print "Marca: "
marca = gets.chomp
print "Modelo: "
modelo = gets.chomp
print "Ano: "
ano = gets.chomp.to_i

# Criando um objeto Carro ou Caminhão
meu_carro = Carro.new(marca, modelo, ano)

# Calculando e exibindo o IPVA
ipva = meu_carro.calcular_ipva
puts "O IPVA do seu carro é: R$ #{ipva.round(2)}" if ipva
