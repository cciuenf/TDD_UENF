# encoding: utf-8

require './CampoMinado'

print "Digite o tamanho do campo: "
tamanho = gets.chomp
puts "O campo possui: #{tamanho.to_i**2/4} bombas. Cuidado !"
puts "Digite linha,coluna separado por vírgula"

campominado = CampoMinado.new(tamanho.to_i)
campominado.colocaBombasAleatoriamente()
campominado.visualizaCampo()
sair = false

  while (sair != true)

    print "\nSelecionar casa: "

    escolha = gets.chomp
    escolha =~ /(.+),(.+)/
	  comando = [$1,$2]

	  sair = campominado.clicaCasa($1.to_i-1,$2.to_i-1)
    campominado.visualizaCampo()

  end

