# holds player's information and moves
class Player
  attr_accessor :name, :guess_count, :guess_track, :guess

  def initialize
    @name = "Player"
    @guess = ""
    @guess_count = 8 # max is 8 tries
    @guess_track = []
  end

  def guess_attempt
    loop do
      puts "\n\nWhat's your guess? (Input an alphabet or attempt to solve the puzzle with a word!)".colorize(INSTRUCTION_COLOUR)
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
      true
    else
      puts "\nYou have provided an invalid guess, please try again".colorize(ERROR_COLOUR)
    end
  end

  def save_game?
    puts "\nWould you like to save the game? Input Y for YES, all other inputs will be taken as a No".colorize(SAVELOAD_COLOUR)
    true if gets.chomp.to_s.downcase == "y"
  end

  def load_game?
    puts "\nWould you like to load a previous saved game? Input Y for YES, all other inputs will be taken as a No".colorize(SAVELOAD_COLOUR)
    true if gets.chomp.to_s.downcase == "y"
  end
end
