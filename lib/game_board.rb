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

  def vertical_winner?(chip)
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

  def horizontal_winner?(chip)
 #4 elements in adjoining columns need to have the same chip at the same index
    #track chip status with a counter - counter = 0
 #how to get the info about the status of each element in an array?
    #go through each individual column (board[:column] - would tell you the value, so board.keys?) and ask what lives there, if it's a chip and if the chips index is the same as it's neighbors index - start the counter. if the counter gets to 4 then player has scored a horizontal win
      #if column[value] == chip then chip += 1
      #to check each row - start at the bottom work up
      #go through one index in each column row.reverse to check for condition
    row_indices = [5,4,3,2,1,0]
    row_indices.each do |row_index|
      counter = 0
      @board.keys.each do |column|
        if @board[column][row_index] == chip
          counter +=1 
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
