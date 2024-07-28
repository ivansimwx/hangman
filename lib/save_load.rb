require "yaml"

# save and load module
module SaveLoad
  SAVED_DIRECTORY = "saved_games"

  def to_yaml
    YAML.dump({
      player: @player,
      computer: @computer
    })
  end

  def save_file
    Dir.mkdir(SAVED_DIRECTORY) unless Dir.exist?(SAVED_DIRECTORY)
    filename = "#{SAVED_DIRECTORY}/save_file_#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.yaml"
    File.open(filename, "w") { |f| f.puts(to_yaml) }
    puts "Game saved to #{filename}"
  end

  def list_files(directory)
    files = Dir.entries(directory)
    puts "Files in #{directory}:"
    files.each { |file| puts file }
  end

  def load_file(filename)
    full_path = "#{SAVED_DIRECTORY}/#{filename}"
    if File.exist?(full_path)
      # from_yaml(filename)
      from_yaml(full_path)
    else
      puts "That file does not exist. Please try again."
    end
  end

  def from_yaml(full_path)
    data = YAML.safe_load_file(full_path, permitted_classes: [Player, Computer, Symbol])
    @player = data[:player]
    @computer = data[:computer]
  end
end
