class ColorOutput

  COLOR_REGEX = /%color:/

  def self.parse_for_color(string)
    split_for_colors(string)
    if has_colors?(string)
      colored_string = @color_string.map.with_index do |string_for_color, index|
        if index == 0
          string_for_color
        else
          current_string = string_for_color.split(" ", 2)
          current_string[1].colorize(current_string[0].to_sym)
        end
      end
      colored_string.join()
    else
      string
    end
  end

  def self.split_for_colors(string)
    @color_string = string.split(COLOR_REGEX)
  end

  def self.has_colors?(text_to_check)
    # Use the color regex to check if the string has any color codes
    text_to_check.split(COLOR_REGEX).count > 1 ? true : false
  end

  def self.help
    puts "How to use Colors:"
    puts "............................................................"
    puts "Colors are started with the color flag:"
    puts "%color:colorname"
    puts "The colorname should be one of the following"
    String.colors.each do |color_symbol|
      puts color_symbol.to_s.colorize(color_symbol)
    end
    true
  end
end