# encoding: utf-8

class CampoMinado

  def initialize (tamanho)
    @tamanho = tamanho
    @bombas = []
    @campo = []

    @tamanho.times do
      @bombas << []
      @campo << []
    end

  end

  def criaCampo()

    for linha in 0..@tamanho-1
			for coluna in 0..@tamanho-1
		    @campo[linha][coluna] = "#"
			end
		end

  end

  def adicionaBomba(linha,coluna)
    @bombas[linha][coluna] = "*"
  end

  def clicaCasa(linha,coluna)
    if (@bombas[linha][coluna] == "*")
       @campo[linha][coluna] = "*"
    else
       @campo[linha][coluna] = "V"
    end
  end

  attr_accessor :bombas, :campo
  attr_reader :tamanho


end

