# holds computer's word information and displays
class Computer
  attr_accessor :word, :guess_state, :name

  def initialize
    @name = "Computer"
    @word = ""
  end

  def new_word(dictionary)
    @word = dictionary.sample
    puts "\nA new #{@word.length}-letter word has been generated:"
    @guess_state = Array.new(@word.length, "_")
  end

  def update_guess_state(guess)
    return unless guess.length == 1

    @word.each_with_index { |char, index| @guess_state[index] = guess if char == guess }
  end
end
