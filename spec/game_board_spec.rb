require 'rspec'
require './lib/game_board'

describe GameBoard do

  it 'exists' do
    board = GameBoard.new

    expect(board).to be_an_instance_of(GameBoard)
  end

  it 'has readable attributes' do
    board = GameBoard.new

    expect(board.board).to eq({
      A: [".", ".", ".", ".", ".", "."],
      B: [".", ".", ".", ".", ".", "."],
      C: [".", ".", ".", ".", ".", "."],
      D: [".", ".", ".", ".", ".", "."],
      E: [".", ".", ".", ".", ".", "."],
      F: [".", ".", ".", ".", ".", "."],
      G: [".", ".", ".", ".", ".", "."]
      })
  end

  it 'prints the board' do
    board = GameBoard.new

    puts board.print_board

    expect(board.print_board).to eq(
      "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n")
  end

  it 'checks column availability' do
    board = GameBoard.new

    expect(board.column_available?(:A)).to eq true
    expect(board.column_available?(:Z)).to eq false
    expect(board.column_available?("B")).to eq false
  end

end
