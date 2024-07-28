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

end
