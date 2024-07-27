require_relative "player"
require_relative "computer"

# controls flow of game and checks for end of game
class GameController
  def initialize(player, computer)
    @player = player
    @computer = computer
  end

  # lines = File.readlines(dictionary_source)
  def play
    puts "\nHi #{@player.name}, welcome to Hangman!"
    @computer.new_word
    prints_guess_state
    @player.guess_attempt
    check_win?
    # check win if player guess word, word is only considered if word length matches
    # check win if player guess alphabet
    # update word state
    # @computer.display_word_state
  end

  def prints_guess_state
    puts @computer.guess_state
  end

  def check_win?
    # if @player.guess == @computer.word
  end
end
