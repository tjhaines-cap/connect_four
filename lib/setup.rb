require './lib/game_board'
require './lib/game_play'

class Setup

attr_reader :welcome_message

    def initialize
        @welcome_message = "Welcome to CONNECT FOUR"
    end

    def main_menu
        p @welcome_message
        p "Enter p to play. Enter q to quit."
            userin = gets.chomp.downcase
           until userin == 'q'
            if userin == 'p'
                board = GameBoard.new
                game_play = GamePlay.new(board)
                game_play.start
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