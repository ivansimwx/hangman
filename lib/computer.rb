# holds computer's word information and displays
class Computer
  attr_reader :name

  def initialize
    @name = "Computer"
  end

  def hangman_dictionary(dictionary_source)
    lines = File.readlines(dictionary_source)
    lines.map { |text| text.delete("\n").chars }
    # lines is an array of words
    # words is an array of words, broken down into array of characters
    # p lines[0]
    # p words[0]
  end

  def rand_word(dictionary)
    dictionary.sample
  end
end
