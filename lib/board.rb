class Board

  attr_reader :board

  def initialize
    @board = {
      A: [".", ".", ".", ".", ".", "."], 
      B: [".", ".", ".", ".", ".", "."], 
      C: [".", ".", ".", ".", ".", "."], 
      D: [".", ".", ".", ".", ".", "."], 
      E: [".", ".", ".", ".", ".", "."], 
      F: [".", ".", ".", ".", ".", "."], 
      G: [".", ".", ".", ".", ".", "."]
    } 
  end 

  def welcome_message
    p "Ready for a challenge?"
  end 

  def print_board
    @board.keys.each do |key|
      print key
    end
    puts
    7.times do |index|
      @board.keys.each do |key|
        print @board[key][index]
      end
      puts 
    end
  end 

end
