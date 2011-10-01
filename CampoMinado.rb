# encoding: utf-8

class CampoMinado

  def initialize (tamanho)

    @tamanho = tamanho
    @limiteBombas = @tamanho**2/4
    @vitoria = @tamanho.to_i**2 - @limiteBombas
    @bombas = []
    @campo = []

    @tamanho.times do
      @bombas << []
      @campo << []
    end

  criaCampo()

  end

  def criaCampo()

    for linha in 0..@tamanho-1
			for coluna in 0..@tamanho-1
		    @campo[linha][coluna] = "#"
			  @bombas[linha][coluna] = ""
			end
		end

  end

  def adicionaBomba(linha,coluna)
    @bombas[linha][coluna] = "*"
  end

  def ehUmaBomba?(linha,coluna)
    if(@bombas[linha][coluna] == "*")
      return true
    else
      return false
    end
  end

  def clicaCasa(linha,coluna)
    if (@bombas[linha][coluna] == "*")
       @campo[linha][coluna] = "*"
       fimDeJogo()

    else
       if(@campo[linha][coluna] == "#")
          @vitoria = @vitoria - 1
          verificaBombasAoRedor(linha,coluna)
      end
    end
  end

  def verificaBombasAoRedor(linha,coluna)
    if (@bombas[linha][coluna] != "*")
    	  @campo[linha][coluna] = 0

      @campo[linha][coluna] += 1 if (linha > 0 && coluna > 0 && @bombas[linha-1][coluna-1] == '*')
      @campo[linha][coluna] += 1 if (linha > 0 && @bombas[linha-1][coluna] == '*')
      @campo[linha][coluna] += 1 if (linha > 0 && coluna+1 < @bombas[linha].length && @bombas[linha-1][coluna+1] == '*')

      @campo[linha][coluna] += 1 if (coluna > 0 && @bombas[linha][coluna-1] == '*')
      @campo[linha][coluna] += 1 if (coluna+1 < @bombas[linha].length && @bombas[linha][coluna+1] == '*')

      @campo[linha][coluna] += 1 if (linha+1 < @bombas.length && coluna > 0 && @bombas[linha+1][coluna-1] == '*')
      @campo[linha][coluna] += 1 if (linha+1 < @bombas.length && @bombas[linha+1][coluna] == '*')
      @campo[linha][coluna] += 1 if (linha+1 < @bombas.length && coluna+1 < @bombas[linha].length && @bombas[linha+1][coluna+1] == '*')

    @campo[linha][coluna] = @campo[linha][coluna].to_s
		end

  end

 def verificaTodasAsCasas()
    @bombas.each_index do |linha|
			@bombas[linha].each_index do |coluna|
				verificaBombasAoRedor(linha,coluna)
			end
		end
 end

 def colocaBombasAleatoriamente()
    bomba = 0

    while (bomba < @limiteBombas)
      if (bomba < @limiteBombas)
        linha = rand(@tamanho)
        coluna = rand(@tamanho)
        if (@bombas[linha][coluna] != "*")
          adicionaBomba(linha,coluna)
          bomba += 1
        end
      end
    end

 end

  def fimDeJogo()
    puts "Acertou uma Bomba. Fim de Jogo!"
    revelaTodasAsBombas()
    verificaTodasAsCasas()
  end

  def ganhouOJogo?()
    if(@vitoria <= 0)
      puts "Parabens. Vc Venceu o jogo!"
      revelaTodasAsBombas()
      return true
    else
      return false
    end
  end

  def revelaTodasAsBombas()
    for linha in 0..@tamanho-1
			for coluna in 0..@tamanho-1
        @campo[linha][coluna] = "*" if (@bombas[linha][coluna] == "*")
      end
	  end
  end

  def visualizaCampo()
    for i in 0..tamanho-1
      p @campo[i]
     end
  end

  attr_accessor :bombas, :campo, :vitoria
  attr_reader :tamanho, :limiteBombas

end

