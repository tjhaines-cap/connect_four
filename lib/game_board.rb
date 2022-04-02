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
    row_element = 0
    if @board[column][-1] == "."
      row_element = 5
    else
      index = 0
      @board[column].each do |chip_home|
        if (chip_home != ".")
          break
        end
        index += 1
      end
      row_element = index - 1
      # puts row_element
    end
    @board[column][row_element] = chip
  end

  def winner?(chip)
    @board.keys.each do |column|
      counter = 0
       @board[column].each do |chip_home|
        if chip_home == chip
          counter += 1
          if counter == 4
            return true
          end
        else
          counter = 0
        end
      end
    end
    false
  end
   

end
