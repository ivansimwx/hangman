
# holds player's information and moves
class Player
  attr_reader :name, :guess_count, :guess_track
  attr_accessor :guess

  def initialize
    @name = "Player"
    @guess = ""
    @guess_count = 8 # max is 8 tries
    @guess_track = []
  end

  def guess_attempt
    loop do
      puts "\n\nWhat's your guess? (Input an alphabet or attempt to solve the puzzle with a word!)"
      guess_get
      break if guess_valid?
    end
    @guess_track.push(@guess)
  end

  def guess_get
    @guess = gets.chomp.to_s.downcase
  end

  def guess_valid?
    if @guess.match?(/[a-z]/)
      @guess_count -= 1
      true
    else
      puts "\nYou have provided an invalid guess, please try again"
    end
  end
end
