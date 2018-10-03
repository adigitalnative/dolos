module EditorActions
  def edit_room
    print_room_edit_options
    parse_editor_input
    
  end

  def print_room_edit_options
    puts "What would you like to edit?"
    puts "Room Name (name)"
    puts "Room Description (desc)"
    puts "Done with edit mode (done)"
    puts "Go to game menu (menu)"
    puts "Exit game (exit)"
  end

  def parse_editor_input
    input = gets.chomp.downcase

    case input
    when "name"
      edit_room_name
    when "desc"
      edit_room_desc
    when "exit"
      exit_game
    when "options"
      print_room_edit_options
    when "done"
      look
      parse_input
    when "menu"
      return_to_menu
    else
      puts "not a valid answer"
    end

    parse_editor_input
  end

  def edit_room_name
    puts "Current room name: #{current_room.name}"
    puts "New room name:"
    new_name = gets.chomp
    current_room.update_attributes(name: new_name)
    puts "Room name now: #{current_room.name}"
    print_room_edit_options
    parse_editor_input
  end

  def edit_room_desc
    puts "Current room description: #{current_room.description}"
    puts "New room description:"
    new_desc = gets.chomp
    current_room.update_attributes(description: new_desc)
    puts "Room Description now:"
    puts "#{current_room.description}"
    print_room_edit_options
    parse_editor_input
  end
end