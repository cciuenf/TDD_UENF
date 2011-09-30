# encoding: utf-8
require './CampoMinado'

describe CampoMinado do

  before do
    @jogo = CampoMinado.new(6)
    @jogo.adicionaBomba(0,1)
    @jogo.adicionaBomba(1,0)
    @jogo.adicionaBomba(3,4)
    @jogo.adicionaBomba(4,4)
    @jogo.adicionaBomba(5,4)
    @jogo.adicionaBomba(4,5)
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
    @jogo.bombas[0][1].should == "*"
	  @jogo.bombas[1][0].should == "*"
	  @jogo.bombas[3][4].should == "*"
	  @jogo.bombas[4][4].should == "*"
    @jogo.bombas[5][4].should == "*"
	  @jogo.bombas[4][5].should == "*"
	end

  it 'Clica em uma bomba e perde o jogo' do
    @jogo.clicaCasa(0,1).should == true
    @jogo.clicaCasa(3,4).should == true
    @jogo.clicaCasa(4,5).should == true
    @jogo.campo[0][1].should == "*"
    @jogo.campo[3][4].should == "*"
    @jogo.campo[4][5].should == "*"
  end

  it 'Clica em uma casa e mostra a quantidade de bombas ao redor dela' do
    @jogo.clicaCasa(3,3).should == false
    @jogo.clicaCasa(4,3).should == false
    @jogo.clicaCasa(0,0).should == false
    @jogo.clicaCasa(1,3).should == false
    @jogo.clicaCasa(2,0).should == false
    @jogo.campo[3][3].should == "2"
    @jogo.campo[4][3].should == "3"
    @jogo.campo[0][0].should == "2"
    @jogo.campo[1][3].should == "0"
    @jogo.campo[2][0].should == "1"
  end

  it 'Clica em uma bomba e o campo eh revelado' do
    @jogo.clicaCasa(1,0).should == true
    @jogo.campo.should == [["2","*","1","1","1","1"],
                           ["*","2","1","0","0","0"],
                           ["1","1","0","1","1","1"],
                           ["1","0","0","2","*","3"],
                           ["1","0","0","3","*","*"],
                           ["1","0","0","2","*","3"]]
  end

end

