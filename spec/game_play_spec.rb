require 'rspec'
require './lib/game_board'
require './lib/game_play'
require 'pry'

describe GamePlay do

  it 'exists' do
    connect_board = GameBoard.new
    play = GamePlay.new(connect_board)

    expect(play).to be_an_instance_of(GamePlay)
  end

  it 'can create valid computer input' do
    connect_board = GameBoard.new
    play = GamePlay.new(connect_board)

    computer_column = play.select_computer_column

    valid_symbols = [:A, :B, :C, :D, :E, :F, :G]

    expect(valid_symbols).to include(computer_column)
  end

  it 'can check for user validity' do
    connect_board = GameBoard.new
    play = GamePlay.new(connect_board)

    player_column = play.get_player_column

    valid_symbols = [:A, :B, :C, :D, :E, :F, :G]

    expect(valid_symbols).to include(player_column)
  end 
end
