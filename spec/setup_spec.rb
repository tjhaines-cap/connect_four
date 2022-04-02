require 'rspec'
require './lib/game_board'
require './lib/game_play'
require './lib/setup'

describe Setup do

    it 'exists' do
        connect_board = GameBoard.new
        new_game = GamePlay.new(connect_board)
        setup = Setup.new(new_game)

        expect(setup).to be_an_instance_of(Setup)
    end 

    it 'has a main menu' do
        connect_board = GameBoard.new
        new_game = GamePlay.new(connect_board)
        setup = Setup.new(new_game)
        

        expect(setup.welcome_message).to eq("Welcome to CONNECT FOUR")
    end
end