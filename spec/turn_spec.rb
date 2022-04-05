require 'rspec'
require './lib/game_board'
require './lib/turn'

describe Turn do

  it 'exists' do
    board = GameBoard.new
    computer_turn = Turn.new(board)

    expect(computer_turn).to be_an_instance_of(Turn)
  end


end
