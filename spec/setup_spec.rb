require 'rspec'
require './lib/game_board'
require './lib/setup'

describe Setup do

    it 'exists' do
        setup = Setup.new("007")

        expect(setup).to be_an_instance_of(Setup)
    end

    it 'has a main menu' do
        setup = Setup.new("007")

        expect(setup.welcome_message).to eq("Welcome to CONNECT FOUR")
    end

    it 'has a name' do
      setup = Setup.new("007")

      expect(setup.name).to eq"007"
    end

end
