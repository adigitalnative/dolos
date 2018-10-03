module ColorOutput

  COLOR_REGEX = /%color:[a-z]*/

  def parse_for_color(string)
    split_for_colors(string)
    if has_colors?(string)
      binding.pry
    else
      string
    end
  end

  def split_string_for_colors
    @color_string = string.split(COLOR_REGEX)
  end

  def has_colors?(text_to_check)
    # Use the color regex to check if the string has any color codes
    text_to_check.split(COLOR_REGEX).count > 1 ? true : false
  end
end