require './lib/game_board'
require './lib/game_play'


board = GameBoard.new
game_play = GamePlay.new(board)
game_play.start
