module EditorActions
  attr_accessor :new_room_params

  def edit_room
    set_new_room_params
    print_room_edit_options
    parse_editor_input
  end

  def set_new_room_params
    @new_room_params = {
      name: current_room.name,
      description: current_room.description
    }
  end

  def print_room_edit_options
    print_current_room_status
    puts "What would you like to edit?"
    puts "Room Name (name)"
    puts "Room Description (desc)"
    puts "Save the edited game (save)"
    puts "Exit editing mode without saving (exit)"
    puts "Go to game menu (menu)"
  end

  def parse_editor_input
    input = gets.chomp.downcase

    case input
    when "name"
      edit_room_name
    when "desc"
      edit_room_desc
    when "exit"
      exit_room_editor
    when "options"
      print_room_edit_options
    when "save"
      save_room
      look
      parse_input
    when "menu"
      return_to_menu
    else
      puts "not a valid answer"
    end

    parse_editor_input
  end

  def exit_room_editor
    look
    parse_input
  end

  def print_current_room_status
    puts "***************************"
    puts "Current Room Status"
    puts "***************************"
    puts new_room_params[:name]
    puts new_room_params[:description]
    puts "***************************"
  end

  def save_room
    current_room.update_attributes(new_room_params)
  end

  def edit_room_name
    puts "Current room name: #{current_room.name}"
    puts "New room name:"
    new_room_params[:name] = ColorOutput.parse_for_color(gets.chomp)
    puts "Room name now: #{current_room.name}"
    print_room_edit_options
    parse_editor_input
  end

  def edit_room_desc
    puts "Current room description: #{current_room.description}"
    puts "New room description:"
    new_room_params[:description] = ColorOutput.parse_for_color(gets.chomp)
    puts "Room Description now:"
    puts "#{current_room.description}"
    print_room_edit_options
    parse_editor_input
  end
end