require 'rspec'
require './lib/game_board'
require './lib/game_play'
require './lib/setup'

describe Setup do

    it 'exists' do
        setup = Setup.new

        expect(setup).to be_an_instance_of(Setup)
    end 
end