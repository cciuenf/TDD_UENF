# encoding: utf-8
require './CampoMinado'

describe CampoMinado do

  before do
    @jogo = CampoMinado.new(6)
    @jogo.adicionaBomba(0,1)
    @jogo.adicionaBomba(1,0)
    @jogo.adicionaBomba(2,3);@jogo.adicionaBomba(2,4);@jogo.adicionaBomba(2,5)
    @jogo.adicionaBomba(3,4)
    @jogo.adicionaBomba(4,4);@jogo.adicionaBomba(4,5)
    @jogo.adicionaBomba(5,4)
  end

  it  'Possui uma dimensao' do
    @jogo.tamanho.should == 6
  end

  it  'Possui um metodo para verificar se uma casa eh uma bomba' do
      @jogo.ehUmaBomba?(0,1).should == true
      @jogo.ehUmaBomba?(2,3).should == true
      @jogo.ehUmaBomba?(2,0).should == false
      @jogo.ehUmaBomba?(5,3).should == false
  end

  it  'Tem um limite de bombas' do
    @jogo.limiteBombas.should == 9
  end

   it  'Tem uma condição de vitoria' do
    @jogo.vitoria.should == 27
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
    @jogo.clicaCasa(0,1)
    @jogo.clicaCasa(3,4)
    @jogo.clicaCasa(4,5)
    @jogo.campo[0][1].should == "*"
    @jogo.campo[3][4].should == "*"
    @jogo.campo[4][5].should == "*"
  end

  it 'Clica em uma casa e mostra a quantidade de bombas ao redor dela' do
    @jogo.clicaCasa(3,3)
    @jogo.clicaCasa(4,3)
    @jogo.clicaCasa(0,0)
    @jogo.clicaCasa(1,3)
    @jogo.clicaCasa(2,0)
    @jogo.campo[3][3].should == "4"
    @jogo.campo[4][3].should == "3"
    @jogo.campo[0][0].should == "2"
    @jogo.campo[1][3].should == "2"
    @jogo.campo[2][0].should == "1"
  end

  it 'Clica em uma bomba e todas as bombas sao reveladas' do
    @jogo.clicaCasa(1,0)
    @jogo.campo.should == [["2","*","1","0","0","0"],
                           ["*","2","2","2","3","2"],
                           ["1","1","1","*","*","*"],
                           ["0","0","1","4","*","5"],
                           ["0","0","0","3","*","*"],
                           ["0","0","0","2","*","3"]]
  end

 it 'Ganha pontos clicando fora de bombas' do
    @jogo.clicaCasa(1,2)
    @jogo.vitoria.should == 26
    @jogo.clicaCasa(5,1)
    @jogo.vitoria.should == 25
    @jogo.clicaCasa(3,2)
    @jogo.vitoria.should == 24
  end

 it 'Vence se clicar em todas as casas sem bombas' do
    @jogo.clicaCasa(0,0);@jogo.clicaCasa(0,2);@jogo.clicaCasa(0,3);@jogo.clicaCasa(0,4);@jogo.clicaCasa(0,5)
    @jogo.clicaCasa(1,1);@jogo.clicaCasa(1,2);@jogo.clicaCasa(1,3);@jogo.clicaCasa(1,4);@jogo.clicaCasa(1,5)
    @jogo.clicaCasa(2,0);@jogo.clicaCasa(2,1);@jogo.clicaCasa(2,2);
    @jogo.clicaCasa(3,0);@jogo.clicaCasa(3,1);@jogo.clicaCasa(3,2);@jogo.clicaCasa(3,3);@jogo.clicaCasa(3,5)
    @jogo.clicaCasa(4,0);@jogo.clicaCasa(4,1);@jogo.clicaCasa(4,2);@jogo.clicaCasa(4,3);
    @jogo.clicaCasa(5,0);@jogo.clicaCasa(5,1);@jogo.clicaCasa(5,2);@jogo.clicaCasa(5,3);@jogo.clicaCasa(5,5)
    @jogo.ganhouOJogo?().should == true
  end

 it 'Nao ganha pontos clicando na mesma casa sem bomba' do
    @jogo.clicaCasa(1,2)
    @jogo.vitoria.should == 26
    @jogo.clicaCasa(1,2)
    @jogo.vitoria.should == 26
    @jogo.clicaCasa(1,2)
    @jogo.vitoria.should == 26
  end

end

