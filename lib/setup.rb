require './lib/game_board'
require './lib/game_play'

class Setup

attr_reader :welcome_message, :new_game

    def initialize(new_game)
        @welcome_message = "Welcome to CONNECT FOUR"
        @new_game = new_game
    end

    def main_menu
        p @welcome_message
        p "Enter p to play. Enter q to quit."
            userin = gets.chomp.downcase
           until userin == 'q'
            if userin == 'p'
                @new_game.start
                p "Enter p to play. Enter q to quit."
                userin = gets.chomp.downcase
            else 
                p "Try again! Enter p to play. Enter q to quit."
                userin = gets.chomp.downcase
            end
        end
            p "Okay, bye!"
    end 

                
end