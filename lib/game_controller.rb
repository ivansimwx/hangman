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
    # puts @computer.word
    loop do
      prints_guess_state
      puts "\nYou have #{@player.guess_count} more guesses"
      puts "\nYour guesses so far: #{@player.guess_track.join(',')}"
      @player.guess_attempt
      @computer.update_guess_state(@player.guess)
      break if gameover?
    end
  end

  def prints_guess_state
    puts "\n #{@computer.guess_state.join(' ')}"
  end

  def gameover?
    if @player.guess == @computer.word.join || @computer.guess_state == @computer.word
      puts "\nCongrats, you have won!"
      true
    elsif @player.guess_count == 0
      puts "\nSorry, you have been hung (lost)"
      puts "\nThe word is <#{@computer.word.join}>"
      true
    end
  end
end
