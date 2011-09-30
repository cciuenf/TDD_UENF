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

  def clicaCasa(linha,coluna)
    if (@bombas[linha][coluna] == "*")
       @campo[linha][coluna] = "*"
       fimDeJogo()
       return true
    else
       verificaBombasAoRedor(linha,coluna)
       return false
    end
  end

  def verificaBombasAoRedor(linha,coluna)
    if (@bombas[linha][coluna] != "*")
    	  @campo[linha][coluna] = 0

      for i in -1..1
			  for j in -1..1
			    break if (linha+i>@tamanho-1 and i==1)
          @campo[linha][coluna] += 1 if (@bombas[linha+i][coluna+j] == "*")
        end
      end
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

    while (bomba <= @tamanho**2/4)
      if (bomba <= @tamanho**2/4)
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

  def visualizaBombas()
    for i in 0..tamanho-1
      p @bombas[i]
     end
  end

  attr_accessor :bombas, :campo
  attr_reader :tamanho

end

