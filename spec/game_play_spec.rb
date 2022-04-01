require 'rspec'
require './lib/game_board'
require './lib/game_play'
require 'pry'

describe GamePlay do

  it 'exists and has readable attributes' do
    connect_board = GameBoard.new
    play = GamePlay.new(connect_board)

    expect(play).to be_an_instance_of(GamePlay)
    expect(play.welcome_message).to eq("Ready for a challenge?")
  end

  it 'can create valid computer input' do
    connect_board = GameBoard.new
    play = GamePlay.new(connect_board)

    computer_column = play.select_computer_column

    valid_symbols = [:A, :B, :C, :D, :E, :F, :G]

    expect(valid_symbols).to include(computer_column)
  end

  it 'can update board when player chooses column' do
    connect_board = GameBoard.new
    play = GamePlay.new(connect_board)

    computer_choice = play.select_computer_column
    
    connect_board = play.update_board(computer_choice)

    expect(play.connect_board.board[computer_choice][5]).to eq("X")
  end 
end
