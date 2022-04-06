require 'rspec'
require './lib/game_board'
require './lib/setup'

describe Setup do

    it 'exists' do
        setup = Setup.new("007")
require 'pry'; binding.pry
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

    it 'can calculate percentage of wins' do
        setup = Setup.new("007")

#have player as key and integer as value? integer being number of wins within an array (having an array of hashes), currently each row in csv file comes in as an array
    end

    xit 'can see a list of top ranking players' do
        setup = Setup.new("007")


    end

end
