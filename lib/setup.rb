require './lib/game_board'
require './lib/game_play'

class Setup

attr_reader :welcome_message

    def initialize
        @welcome_message = "Welcome to CONNECT FOUR"
    end

    def main_menu
        puts @welcome_message
        puts "Enter p to play. Enter q to quit."
            userin = gets.chomp.downcase
           until userin == 'q'
              if userin == 'p'
                  board = GameBoard.new
                  game_play = GamePlay.new(board)
                  puts board.print_board
                  game_play.start
                  puts "Enter p to play. Enter q to quit."
                  userin = gets.chomp.downcase
              else
                  puts "Try again! Enter p to play. Enter q to quit."
                  userin = gets.chomp.downcase
              end
           end
        puts "Okay, bye!"
    end


end
