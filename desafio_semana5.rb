class Veiculo
  attr_accessor :marca, :modelo, :ano, :capacidade_de_combustivel

  def initialize(marca, modelo, ano, capacidade_de_combustivel)
    @marca = marca
    @modelo = modelo
    @ano = ano
    @capacidade_de_combustivel = capacidade_de_combustivel
  end
  def abastecer(quantidade)
    puts "Abastecendo #{quantidade} litros..."
  end

  def mover
    puts "O veículo está se movendo."
  end
end

class Carro < Veiculo
  attr_accessor :numero_de_portas

  def initialize(marca, modelo, ano, capacidade_de_combustivel, numero_de_portas)
    super(marca, modelo, ano, capacidade_de_combustivel)
    @numero_de_portas = numero_de_portas
  end

  def mover
    puts "O carro está percorrendo a estrada."
  end
end

class Caminhao < Veiculo
  attr_accessor :capacidade_de_carga

  def initialize(marca, modelo, ano, capacidade_de_combustivel, capacidade_de_carga)
    super(marca, modelo, ano, capacidade_de_combustivel)
    @capacidade_de_carga = capacidade_de_carga
  end

  def mover
    puts "O caminhão está transportando carga."
  end
end
