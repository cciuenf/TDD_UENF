# encoding: utf-8

require './CampoMinado'

describe CampoMinado do

  before do
    @jogo = CampoMinado.new(3)
	end

  it  'possui uma dimensao' do
    @jogo.tamanho.should == 3
  end

  it  'possui um campo sem nada do tamanho certo' do
    @jogo.bombas.should == [[],[],[]]
  end

  it 'cria um campo escondido' do
    @jogo.criaCampo()
    @jogo.bombas.should == [["#","#","#"],["#","#","#"],["#","#","#"]]
	end



end

