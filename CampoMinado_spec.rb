# encoding: utf-8

require './CampoMinado'

describe CampoMinado do

  before do
    @jogo = CampoMinado.new(6)
    @jogo.adicionaBomba(2,0)
	  @jogo.adicionaBomba(0,2)
	  @jogo.adicionaBomba(3,4)
	  @jogo.adicionaBomba(4,1)
	  @jogo.adicionaBomba(1,4)
	  @jogo.adicionaBomba(5,5)
	end

  it  'Possui uma dimensao' do
    @jogo.tamanho.should == 6
  end

  it 'Tem um campo que esconde as bombas' do
    @jogo.campo.should == [["#","#","#","#","#","#"],
                           ["#","#","#","#","#","#"],
                           ["#","#","#","#","#","#"],
                           ["#","#","#","#","#","#"],
                           ["#","#","#","#","#","#"],
                           ["#","#","#","#","#","#"]]
	end

  it 'Coloca as bombas no lugares corretos' do
    @jogo.bombas[2][0].should == "*"
	  @jogo.bombas[0][2].should == "*"
	  @jogo.bombas[3][4].should == "*"
	  @jogo.bombas[4][1].should == "*"
    @jogo.bombas[1][4].should == "*"
	  @jogo.bombas[5][5].should == "*"
	end

  it 'Clica em uma bomba e perde o jogo' do
    @jogo.clicaCasa(2,0).should == "Acertou uma Bomba. Fim de Jogo!"
    @jogo.clicaCasa(3,4).should == "Acertou uma Bomba. Fim de Jogo!"
    @jogo.clicaCasa(1,4).should == "Acertou uma Bomba. Fim de Jogo!"
    @jogo.campo[2][0].should == "*"
    @jogo.campo[3][4].should == "*"
    @jogo.campo[1][4].should == "*"
  end

  it 'Clica em uma casa e mostra a quantidade de bombas ao redor dela' do
    @jogo.clicaCasa(3,3)
    @jogo.campo[3][3].should == "1"
  end

end

