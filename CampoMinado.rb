# encoding: utf-8

class CampoMinado

  def initialize (tamanho)
    @tamanho = tamanho
    @bombas = []

    @tamanho.times do
      @bombas << []
    end

  end


  def criaCampo()

    for linha in 0..@tamanho-1
			for coluna in 0..@tamanho-1
		    @bombas[linha][coluna] = "#"
			end
		end

  end

  def adicionaBomba(linha,coluna)
    @bombas[linha][coluna] = "*"
  end


  attr_accessor :bombas
  attr_reader :tamanho


end

