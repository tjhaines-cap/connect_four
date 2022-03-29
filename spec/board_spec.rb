require 'rspec'
require './lib/board'

describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
  end

  it 'has readable attributes' do
    game_board = Board.new

    expect(game_board.board).to eq({"A" => [".", ".", ".", ".", ".", "."], "B" => [".", ".", ".", ".", ".", "."], "C" => [".", ".", ".", ".", ".", "."], "D" => [".", ".", ".", ".", ".", "."], "E" => [".", ".", ".", ".", ".", "."], "F" => [".", ".", ".", ".", ".", "."], "G" => [".", ".", ".", ".", ".", "."]})
  end

end
