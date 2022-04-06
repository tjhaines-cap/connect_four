require './lib/game_board'
require './lib/turn'

class Setup

attr_reader :welcome_message, :name

    def initialize(name)
        @welcome_message = "Welcome to CONNECT FOUR #{name}"
        @name = name
    end

    def main_menu
        # require 'pry'; binding.pry
        puts @welcome_message
        puts "Enter p to play. Enter q to quit."
        userin = gets.chomp.downcase
         until userin == 'q'
            if userin == 'p'
                board = GameBoard.new
                puts board.print_board
                self.start(board)
                puts "Enter p to play. Enter q to quit."
                userin = gets.chomp.downcase
            else
                puts "Try again! Enter p to play. Enter q to quit."
                userin = gets.chomp.downcase
            end
         end
        puts "Okay, bye!"
    end


      def start(board)
        draw = true
        21.times do
          player_turn = Turn.new(board, @name)
          player_turn.player_turn
          if player_turn.has_won?("X")
            draw = false
            break
          end
          computer_turn = Turn.new(board, "Robot")
          computer_turn.computer_turn
          if computer_turn.has_won?("O")
            draw = false
            break
          end
        end
        if draw
          puts "Not Not-You and You both did not win. DRAW."
        end
      end

      def winning_percentage
        
      end

end
