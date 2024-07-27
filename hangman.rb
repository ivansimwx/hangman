require_relative "lib/computer"
require_relative "lib/game_controller"
require_relative "lib/player"

computer = Computer.new
player = Player.new
game = GameController.new(player, computer)
game.play

# start game
# ask player if they want to load game
# if no, randomly pick word from hangman_dictionary
# initialise a display of blank space to represent the word length
# player turn starts
# player picks an alphabet or guesses the whole word
# if guess alphabet, checks if alphabet exist
#   if last char is filled, player wins
#   if char exist, show where alphabet is positioned in the blank space
#   if char does not exist in word, reduce number of available guesses by 1
# if guess word, checks if answer is accurate
#   if accurate, player wins
#   if char does not exist in word, reduce number of available guesses by 1
#  if we d
# if word is fully formed before or equal to 8th guess, player wins
# if word is not formed before or equal to 8th guess, player loses i.e. hung
