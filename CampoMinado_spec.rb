# encoding: utf-8

require './CampoMinado'

describe CampoMinado do

  before do
    @jogo = CampoMinado.new(3)
    @jogo.criaCampo()
    @jogo.adicionaBomba(2,0)
	  @jogo.adicionaBomba(0,2)
	end

  it  'Possui uma dimensao' do
    @jogo.tamanho.should == 3
  end

  it 'Cria um campo para esconder as bombas ' do
    @jogo.campo.should == [["#","#","#"],["#","#","#"],["#","#","#"]]
	end

  it 'Testa se as bombas estao sendo colocadas no lugar certo' do
    @jogo.bombas[2][0].should == "*"
	  @jogo.bombas[0][2].should == "*"
	end

  it 'Testa o clique numa Bomba' do
    @jogo.clicaCasa(2,0)
    @jogo.campo[2][0].should == "*"
  end

  it 'Testa o clique numa casa e a contagem de bombas ao redor dela' do
    @jogo.clicaCasa(1,1)
    @jogo.campo[1][1].should == "2"
  end

end

