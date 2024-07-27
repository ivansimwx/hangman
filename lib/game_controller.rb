require_relative "player"
require_relative "computer"

# controls flow of game and checks for end of game
class GameController
  def initialize(player, computer)
    @player = player
    @computer = computer
    dictionary_source = "google-10000-english-no-swears.txt"
    @dictionary = @computer.hangman_dictionary(dictionary_source)
  end

  # lines = File.readlines(dictionary_source)
  def play
    word = @computer.rand_word(@dictionary)
  end
end
