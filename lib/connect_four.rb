require './lib/game_board'
require './lib/game_play'

puts "Welcome to Connect Four"
board = GameBoard.new
game_play = GamePlay.new(board)
game_play.start
