require_relative "lib/computer"
require_relative "lib/game_controller"
require_relative "lib/player"

computer = Computer.new
player = Player.new
game = GameController.new(player, computer)
game.play
