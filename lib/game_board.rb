class GameBoard

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

  def print_board
    output = ""
    @board.keys.each do |key|
      output << key.to_s
    end
    output << "\n"
    6.times do |index|
      @board.keys.each do |key|
        output << @board[key][index]
      end
      output << "\n"
    end
    return output
  end

end
