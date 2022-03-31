require './lib/game_board'
require 'pry'

class GamePlay

  attr_reader :connect_board

  def initialize(connect_board)
    @connect_board = connect_board
  end

  def start
    p get_user_input
    p select_computer_column
    # puts "Choose a column A-G by typing out the associated letter"
    # input = gets.chomp.to_sym
    # puts input
  end

  def get_user_input
    puts "Choose a column A-G by typing out the associated letter"
    user_input = gets.chomp.to_sym
    return user_input
  end

  def select_computer_column
    column_symbols = [:A, :B, :C, :D, :E, :F, :G]
      computer_column = column_symbols[rand(6)]
        until column_symbols.include?(computer_column)
          computer_column = column_symbols[rand(6)]
        end 
      return computer_column
  end


end
