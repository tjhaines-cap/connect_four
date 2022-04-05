require './lib/game_board'
require 'csv'

class Turn

  def initialize(board)
    @board = board
  end

  def player_turn
    player_column = get_player_column
    @board.place_piece(player_column, "X")
    puts @board.print_board
  end

  def computer_turn
    puts("Computer's turn")
    computer_column = select_computer_column
    @board.place_piece(computer_column, "O")
    puts @board.print_board
  end

  def has_won?(chip)
    if @board.winner?(chip)
      if chip == "O"
        puts "Not-You has won, sad day for you"
        CSV.open("lib/win_loss_tracker.csv", "a") do |csv|
          csv << ["Computer win", 1]
        end
        return true
      else
        puts "You have won, well done!"
        CSV.open("lib/win_loss_tracker.csv", "a") do |csv|
          csv << ["Player win"]
        end
        return true
      end
    else
      return false
    end
  end

  def get_player_column
    puts "Choose a column A-G by typing out the associated letter"
    player_column = gets.chomp.upcase.to_sym
    until @board.column_available?(player_column)
      p "Invalid input entered, try again!"
      player_column = gets.chomp.upcase.to_sym
    end
    return player_column
  end

  def select_computer_column
    valid_symbols = [:A, :B, :C, :D, :E, :F, :G]
      computer_column = valid_symbols[rand(6)]
        until @board.column_available?(computer_column)
          computer_column = valid_symbols[rand(6)]
        end
      return computer_column
  end

end
