require './lib/game_board'
require './lib/setup'

print "Enter a code name: "
name = gets.chomp
new_game = Setup.new(name)
new_game.main_menu
