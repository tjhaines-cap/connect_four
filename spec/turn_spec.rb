require 'rspec'
require './lib/game_board'
require './lib/turn'

describe Turn do

  it 'exists' do
    board = GameBoard.new
    computer_turn = Turn.new(board, "Robot")

    expect(computer_turn).to be_an_instance_of(Turn)
  end

  it 'has attributes' do
    board = GameBoard.new
    computer_turn = Turn.new(board, "Robot")

    expect(computer_turn.name).to eq "Robot"
  end

  it 'can create valid computer input' do
    board = GameBoard.new
    computer_turn = Turn.new(board, "Robot")

    computer_column = computer_turn.select_computer_column

    valid_symbols = [:A, :B, :C, :D, :E, :F, :G]

    expect(valid_symbols).to include(computer_column)
  end

  it 'can determine if someone won the game' do
    board = GameBoard.new
    computer_turn = Turn.new(board, "Robot")

    expect(computer_turn.has_won?("O")).to eq false

    board.place_piece(:D, "O")
    board.place_piece(:D, "O")
    board.place_piece(:D, "O")
    board.place_piece(:D, "O")
    board.place_piece(:D, "X")
    board.place_piece(:D, "X")

    expect(computer_turn.has_won?("O")).to eq true
  end


end
