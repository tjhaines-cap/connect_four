require 'rspec'
require './lib/board'

describe Board do

  it 'exists' do
    board = Board.new

    expect(board).to be_an_instance_of(Board)
  end

  it 'has readable attributes' do
    board = Board.new

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

  it 'has a welcome message' do
    board = Board.new
    welcome_string = board.welcome_message

    expect(welcome_string).to eq("Ready for a challenge?")
  end

  # it 'prints the board' do
  #   board = Board.new
  #   board.print_board

  #   expect(board.board).to eq(ABCDEFG
  #     .......
  #     .......
  #     .......
  #     .......
  #     .......
  #     .......")
  # end 

end
