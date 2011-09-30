# encoding: utf-8

require './CampoMinado'

campominado = CampoMinado.new(6)
campominado.colocaBombasAleatoriamente()
campominado.visualizaCampo()
sair = false

  while (sair != true)

    print "\nSelecionar casa: "

    escolha = gets.chomp
    escolha =~ /(.+),(.+)/
	  comando = [$1,$2]

	  sair = campominado.clicaCasa($1.to_i,$2.to_i)
    campominado.visualizaCampo()

  end

