require './lib/game_board'
require 'csv'

class Turn

  attr_reader :name
  
  def initialize(board, name)
    @board = board
    @name = name
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
        self.add_to_csv("Robot")
        # CSV.open("lib/win_loss_tracker.csv", "a") do |csv|
        #   csv << ["Computer win"]
        # end
        return true
      else
        puts "#{@name} won, well done!"
        self.add_to_csv(@name)
        # CSV.open("lib/win_loss_tracker.csv", "a") do |csv|
        #   csv << ["#{@name} win"]
        # end
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

  def add_to_csv(name)
    CSV.open("lib/win_loss_tracker.csv", "a+") do |csv|
      # csv << ["#{name} win"]
      # csv.each do |row|
      repeaters = csv.find_all do |row|
        row[0] == name
        # if row[0] == name
        #   #retrieve value associated with name
        #   current_score = row[1].to_i 
        #   current_score += 1
        #   csv << [name, current_score]
        #   # row[1] = current_score
        #   p "Your current score is #{current_score}"
        #   return 
        # end
      end
      if repeaters.length > 0 
        current_score = repeaters.last[1].to_i #accesses score via index with array of [name, score]
          current_score += 1
          csv << [name, current_score]
          # row[1] = current_score
          p "Your current score is #{current_score}"
      else 
        csv << [name, 1]
      end
    end
  end

end
