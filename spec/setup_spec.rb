require 'rspec'
require './lib/game_board'
require './lib/setup'

describe Setup do

    it 'exists' do
        setup = Setup.new

        expect(setup).to be_an_instance_of(Setup)
    end

    it 'has a main menu' do
        setup = Setup.new

        expect(setup.welcome_message).to eq("Welcome to CONNECT FOUR")
    end

end
