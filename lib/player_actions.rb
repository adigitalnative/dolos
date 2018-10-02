module PlayerActions

  def parse_input
    @input = gets.chomp

    case @input.downcase
    when "exit"
      return exit
    end
    
    parse_input
  end

  def look
    puts current_room.name
    puts ""
    puts current_room.description
    puts current_room.list_exits
  end

  def exit
    puts "Goodbye!"
  end
end