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
   
  def diagonal_winner?(chip)
    #go through each row
    for i in 0..5
      row = i
      keys = @board.keys
      if check_diagonal_columns?(keys, row, i, chip)
        return true
      end
    end
    for i in 0..5
      row = i
      keys_reversed = @board.keys.reverse
      if check_diagonal_columns?(keys_reversed, row, i, chip)
        return true
      end
    end
    return false
  end

  def check_diagonal_columns?(column_array, row, i, chip)
    count_chips = 0
    column_array.each do |col|
      #do not allow loop to continue if row has been decremented past 0
      if row < 0 || row > 5
        break
      end
      #check downward diagonal if starting in rows 0-2
      if i <=2
        if @board[col][row] == chip
          count_chips += 1
          if count_chips == 4
            return true
          end
        else
          count_chips = 0
        end
        row += 1
      #check upward diagonal if starting in rows 3-5
      else
        if @board[col][row] == chip
          count_chips += 1
          # puts "chip at #{col} and #{row}"
          if count_chips == 4
            return true
          end
        else
          count_chips = 0
        end
        row = row - 1
      end
    end
    return false
  end

  def winner?(chip)
    if self.vertical_winner?(chip) 
      return true
    elsif self.horizontal_winner?(chip)
      return true
    elsif self.diagonal_winner?(chip)
      return true
    end
    return false
  end
end
