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

  def column_available?(column)
   return @board.keys.include?(column) && @board[column].include?(".")
  end

  def place_piece(column, chip)
    row = 0
    if @board[column][5] == "."
      row = 5
    else
      index = 0
      @board[column].each do |cell|
        index += 1
        if (cell != ".")
          break
        end
      end
      row = index - 2
      puts row
    end
    @board[column][row] = chip
  end

end
