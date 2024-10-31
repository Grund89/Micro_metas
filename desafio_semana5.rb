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
        # Inicializa a classe FipeApi
        fipe_api = FipeApi::Fipe.new

        # Busca o veículo usando o método correto
        veiculo_fipe = fipe_api.buscar_por_marca_modelo_ano(@marca, @modelo, @ano)

        if veiculo_fipe && veiculo_fipe['valor']
          valor_veiculo = veiculo_fipe['valor'].gsub("R$ ", "").gsub(".", "").gsub(",", ".").to_f
          redis.set(cache_key, valor_veiculo, ex: 3600) # Cache por 1 hora
        else
          puts "Veículo não encontrado na tabela FIPE."
          return nil
        end
      rescue StandardError => e
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

# Criando um objeto Carro
meu_carro = Carro.new(marca, modelo, ano)

# Calculando e exibindo o IPVA
ipva = meu_carro.calcular_ipva
puts "O IPVA do seu carro é: R$ #{ipva.round(2)}" if ipva
