require './lib/game_board'
require 'pry'

class GamePlay

  attr_reader :connect_board, :welcome_message

  def initialize(connect_board)
    @connect_board = connect_board
    @welcome_message = "Ready for a challenge?"
  end

  def start
    p @welcome_message
    p get_player_column
    p select_computer_column
    # puts "Choose a column A-G by typing out the associated letter"
    # input = gets.chomp.to_sym
    # puts input
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
