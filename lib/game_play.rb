require './lib/game_board'
require 'pry'

class GamePlay

  attr_reader :connect_board

  def initialize(connect_board)
    @connect_board = connect_board
  end

  def start
    p @welcome_message
    21.times do
      player_column = get_player_column
      @connect_board.place_piece(player_column, "X")
      puts @connect_board.print_board
      #check for winner
      puts("Computer's turn")
      computer_column = select_computer_column
      @connect_board.place_piece(computer_column, "O")
      puts @connect_board.print_board
      #check for winner
    end
  end

  def get_player_column
    puts "Choose a column A-G by typing out the associated letter"
    player_column = gets.chomp.to_sym
    until @connect_board.column_available?(player_column)
      p "Invalid input entered, try again!"
      player_column = gets.chomp.to_sym
    end
    return player_column
  end

  def select_computer_column
    valid_symbols = [:A, :B, :C, :D, :E, :F, :G]
      computer_column = valid_symbols[rand(6)]
        until @connect_board.column_available?(computer_column)
          computer_column = valid_symbols[rand(6)]
        end
      return computer_column
    end



end
