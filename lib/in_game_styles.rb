class StyleElement
  GAME_WIDTH = 70

  def self.divider
    characters = "✳︎"
    string = ""
    GAME_WIDTH.times { string += characters }
    puts string.colorize(:light_black)
  end

  def self.game_width
    GAME_WIDTH
  end

  def self.prompt_cue
    print "\e[0;32;49m➣  \e[0m"
  end

  def self.menu_divider
    characters = "."
    string = ""
    (GAME_WIDTH/characters.length).times { string += characters }
    puts string.colorize(:gray)
  end

  def self.menu_doc(command, description)
    puts command + description.rjust(GAME_WIDTH-command.length,".")
  end
end
