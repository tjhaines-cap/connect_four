require 'rspec'
require './lib/game_board'

describe GameBoard do

  it 'exists' do
    board = GameBoard.new

    expect(board).to be_an_instance_of(GameBoard)
  end

  it 'has readable attributes' do
    board = GameBoard.new

    expect(board.board).to eq({
      A: [".", ".", ".", ".", ".", "."],
      B: [".", ".", ".", ".", ".", "."],
      C: [".", ".", ".", ".", ".", "."],
      D: [".", ".", ".", ".", ".", "."],
      E: [".", ".", ".", ".", ".", "."],
      F: [".", ".", ".", ".", ".", "."],
      G: [".", ".", ".", ".", ".", "."]
      })
  end


  it 'prints the board' do
    board = GameBoard.new

    puts board.print_board

    expect(board.print_board).to eq(
      "ABCDEFG\n.......\n.......\n.......\n.......\n.......\n.......\n")
  end

  it 'checks column availability' do
    board = GameBoard.new

    expect(board.column_available?(:A)).to eq true
    expect(board.column_available?(:Z)).to eq false
    expect(board.column_available?("B")).to eq false
  end

  it 'places a piece in the lowest avaliable spot in the column' do
    board = GameBoard.new

    board.place_piece(:A, "X")
    expect(board.board[:A][5]).to eq("X")
    board.place_piece(:A, "O")
    expect(board.board[:A][4]).to eq("O")
    board.place_piece(:F, "X")
    expect(board.board[:F][5]).to eq("X")
    board.place_piece(:D, "O")
    expect(board.board[:D][5]).to eq("O")
  end

  it 'can determine a vertical winning pattern in a column' do
    board = GameBoard.new

    expect(board.vertical_winner?("O")).to eq false

    board.place_piece(:D, "O")
    board.place_piece(:D, "O")
    board.place_piece(:D, "O")
    board.place_piece(:D, "O")

    board.place_piece(:D, "X")
    board.place_piece(:D, "X")
    expect(board.vertical_winner?("O")).to eq true
  end 

  it 'can determine horizontal winning pattern' do
    board = GameBoard.new

    expect(board.horizontal_winner?("O")).to eq false

    board.place_piece(:A, "O") #different column arguments than vertical
    board.place_piece(:B, "O")
    board.place_piece(:C, "O")
    board.place_piece(:D, "O")   
    
    board.place_piece(:E, "X")
    board.place_piece(:F, "X")
    # require 'pry'; binding.pry
    expect(board.horizontal_winner?("O")).to eq true
    expect(board.winner?("O")).to eq true
  end

  it "can determine a winning pattern diagonally from left side of board" do
    board = GameBoard.new

    expect(board.diagonal_winner?("O")).to eq false

    board.place_piece(:A, "O")
    board.place_piece(:A, "X")
    board.place_piece(:A, "X")
    board.place_piece(:A, "O")
    board.place_piece(:B, "X")
    board.place_piece(:B, "O")
    board.place_piece(:B, "O")
    board.place_piece(:C, "X")
    board.place_piece(:C, "O")
    board.place_piece(:C, "O")
    board.place_piece(:D, "O")
    board.place_piece(:D, "X")
    board.place_piece(:D, "O")
    board.place_piece(:D, "X")
    puts board.print_board

    expect(board.diagonal_winner?("O")).to eq true
  end

  it "can determine winner diagonally from right side of board" do
    board = GameBoard.new

    expect(board.diagonal_winner?("O")).to eq false

    board.place_piece(:G, "O")
    board.place_piece(:G, "O")
    board.place_piece(:G, "O")
    board.place_piece(:G, "X")
    board.place_piece(:F, "X")
    board.place_piece(:F, "O")
    board.place_piece(:F, "O")
    board.place_piece(:E, "X")
    board.place_piece(:E, "O")
    board.place_piece(:E, "O")
    board.place_piece(:D, "O")
    board.place_piece(:D, "X")
    board.place_piece(:D, "X")
    board.place_piece(:D, "O")
    puts board.print_board
    expect(board.diagonal_winner?("O")).to eq true
  end
end
