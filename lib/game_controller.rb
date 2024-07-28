require_relative "player"
require_relative "computer"
require_relative "save_load"

INSTRUCTION_COLOUR = :green
ERROR_COLOUR = :red
SAVELOAD_COLOUR = :yellow

# controls flow of game and checks for end of game
class GameController
  include SaveLoad
  attr_accessor :player, :computer

  def initialize(player, computer)
    @player = player
    @computer = computer
    dictionary_source = "google-10000-english-no-swears.txt"
    @dictionary = hangman_dictionary(dictionary_source)
  end

  def play
    puts "\nHi #{@player.name}, welcome to Hangman!"
    new_game?
    loop do
      prints_guess_state
      save_file if @player.save_game?
      @player.guess_attempt
      update_guess_state(@player.guess)
      break if gameover?
    end
  end

  def hangman_dictionary(dictionary_source)
    lines = File.readlines(dictionary_source) # lines is an array of words
    lines.map { |text| text.delete("\n").chars } # returns an array of words, broken down into array of characters
  end

  def new_game?
    if Dir.exist?(SAVED_DIRECTORY) && @player.load_game?
      list_files(SAVED_DIRECTORY)
      puts "Which file would you like to load?"
      filename = gets.chomp.to_s
      load_file(filename)
    else
      puts "A New Game will be started"
      @computer.new_word(@dictionary)
    end
  end

  def prints_guess_state
    puts "\n #{@computer.guess_state.join(' ')}"
    puts "\nYou have #{@player.guess_count} more guesses"
    puts "\nYour guesses so far: #{@player.guess_track.join(',')}"
  end

  def update_guess_state(guess)
    match_check = false
    if guess.length == 1
      @computer.word.each_with_index do |char, index|
        if char == guess
          @computer.guess_state[index] = guess
          match_check = true
        end
      end
    end
    @player.guess_count -= 1 unless match_check == true
  end

  def gameover?
    if @player.guess == @computer.word.join || @computer.guess_state == @computer.word
      puts "\nCongrats, you have won!"
      true
    elsif @player.guess_count.zero?
      puts "\nSorry, you have been hung (lost)"
      puts "\nThe word is <#{@computer.word.join}>"
      true
    end
  end
end
