require 'rspec'
require './lib/game_board'
require './lib/turn'

describe Turn do

  it 'exists' do
    board = GameBoard.new
    chip = "O"
    computer_turn = Turn.new(board, chip)

    expect(computer_turn).to be_an_instance_of(Turn)
  end
end
