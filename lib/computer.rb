# holds computer's word information and displays
class Computer
  attr_reader :name
  attr_accessor :word, :guess_state

  def initialize
    @name = "Computer"
    dictionary_source = "google-10000-english-no-swears.txt"
    @dictionary = hangman_dictionary(dictionary_source)
    @word = ""
  end

  def hangman_dictionary(dictionary_source)
    lines = File.readlines(dictionary_source) # lines is an array of words
    lines.map { |text| text.delete("\n").chars } # returns an array of words, broken down into array of characters
  end

  def new_word
    @word = @dictionary.sample
    puts "\nA new #{@word.length}-letter word has been generated:"
    @guess_state = Array.new(@word.length, "_")
  end

  def update_guess_state(guess)
    return unless guess.length == 1

    @word.each_with_index { |char, index| @guess_state[index] = guess if char == guess }
  end
end
