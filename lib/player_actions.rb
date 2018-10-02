module PlayerActions

  def parse_input
    @input = gets.chomp.downcase

    case @input.split(" ").first
    when "exit"
      return exit
    when "move"
      move(@input.split(" ", 2).last)
    when "look"
      look
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

  def move(exit_string)
    door = current_room.exits.find {|door| door.name = exit_string }
    if door
      player.room = door.entrance
      look
    else
      puts "invalid entry please try again."
    end
  end
end