require './lib/game_board'

class GamePlay

  attr_reader :connect_board

  def initialize(connect_board)
    @connect_board = connect_board
    @welcome_message = "Ready for a challenge?"
  end

  def start
    #loop do
    # puts "Choose a column 'A-G' by typing out the associated letter"
    # userin = gets.chomp.upcase.to_sym
    # takes input and uses it to place 'X' in the lowest row available
      #if userin != "A", "B", "C", "D", "E", "F", "G"
        #p "invalid input, please try again"
      #elsif userin = "A"
        # -iterate through so it starts with [column].values.last replace board[A:][5]"." with "X"
        #columns.map do |column|
          #column.key.value.last = 'X'
        #end
        #p column
  end


end
