# encoding: utf-8

require './CampoMinado'

print "Digite o tamanho do campo: "
tamanho = gets.chomp
campominado = CampoMinado.new(tamanho.to_i)
campominado.colocaBombasAleatoriamente()
puts "O campo possui: #{campominado.limiteBombas} bombas. Cuidado !"
puts "Digite linha,coluna separado por vírgula"

campominado.visualizaCampo()
sair = false

  while (sair != true)

    print "\nSelecionar casa: "

    escolha = gets.chomp
    escolha =~ /(.+),(.+)/
	  comando = [$1,$2]

	  campominado.clicaCasa($1.to_i-1,$2.to_i-1)
    sair = campominado.ehUmaBomba?($1.to_i-1,$2.to_i-1) || campominado.ganhouOJogo?()

    campominado.visualizaCampo()

  end

