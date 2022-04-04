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

  def diagonal_winner?(chip)
    #go through each row
    for i in 0..5
      count_chips = 0
      row = i
      # puts "start at #{row}"
      @board.keys.each do |col|
        #do not allow loop to continue if row has been decremented past 0
        if row < 0
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
    end
    for i in 0..5
      count_chips = 0
      row = i
      # puts "start at #{row}"
      keys_reversed = @board.keys.reverse
      keys_reversed.each do |col|
        #do not allow loop to continue if row has been decremented past 0
        if row < 0
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
    end
    return false
  end


end
