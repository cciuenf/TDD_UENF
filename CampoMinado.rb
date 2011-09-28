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
    for i in 0..@tamanho-1
			for j in 0..@tamanho-1
		    @bombas[i][j] = "#"
			end
		end

  end



  attr_accessor :bombas
  attr_reader :tamanho


end

