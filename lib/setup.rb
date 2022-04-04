require './lib/game_board'

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
          player_column = get_player_column(board)
          board.place_piece(player_column, "X")
          puts board.print_board
          if board.winner?("X")
            puts "You have won, well done!"
            draw = false
            break
          end
          puts("Computer's turn")
          computer_column = select_computer_column(board)
          board.place_piece(computer_column, "O")
          puts board.print_board
          if board.winner?("O")
            puts "Not-You has won, sad day for you"
            draw = false
            break
          end
        end
        if draw == true
          puts "Not-You and You both did not win. DRAW."
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
