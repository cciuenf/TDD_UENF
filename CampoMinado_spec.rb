# encoding: utf-8

require './CampoMinado'

describe CampoMinado do

  before do
    @jogo = CampoMinado.new(3)
	end

  it 'possui uma dimensao' do
		@jogo.tamanho.should ==  3
	end

end

