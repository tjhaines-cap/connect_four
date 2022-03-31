require './lib/game_board'

class GamePlay

  attr_reader :connect_board

  def initialize(connect_board)
    @connect_board = connect_board
  end

  def start
    # puts "Choose a column A-G by typing out the associated letter"
    # input = gets.chomp.to_sym
    # puts input
  end

  def select_computer_column
    column_symbols = [:A, :B, :C, :D, :E, :F, :G]
    computer_column = column_symbols[rand(6)]
    return computer_column
  end


end
