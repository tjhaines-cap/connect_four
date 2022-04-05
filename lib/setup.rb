require './lib/game_board'
require './lib/turn'

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
          player_turn = Turn.new(board)
          player_turn.player_turn
          if player_turn.has_won?("X")
            draw = false
            break
          end
          computer_turn = Turn.new(board)
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

      def get_player_column(board)
        puts "Choose a column A-G by typing out the associated letter"
        player_column = gets.chomp.upcase.to_sym
        until board.column_available?(player_column)
          p "Invalid input entered, try again!"
          player_column = gets.chomp.upcase.to_sym
        end
        return player_column
      end

      def select_computer_column(board)
        valid_symbols = [:A, :B, :C, :D, :E, :F, :G]
          computer_column = valid_symbols[rand(6)]
            until board.column_available?(computer_column)
              computer_column = valid_symbols[rand(6)]
            end
          return computer_column
      end





end
