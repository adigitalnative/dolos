module BuilderActions
  def enter_build_mode
    puts "Entering build mode"
    build_mode_menu
    get_build_input
  end


  def build_mode_menu
    puts "Build Mode: Available Commands"
    puts "dig...............dig a new room"
    puts "connect...........connect to an existing room"
    puts "list..............list all available rooms"
    puts "teleport..........teleport to a specific room"
    puts ""
  end

  def get_build_input
    input = gets.chomp

    case input.downcase
    when "list"
      list_game_rooms
      build_mode_menu
      get_build_input
    when "connect"
      connect_room_prompt
      build_mode_menu
      get_build_input
    when "dig"
      dig_room_prompt
      build_mode_menu
      get_build_input
    when "teleport"
      teleport
    when "exit"
      exit_build_mode
    end
  end

  def list_game_rooms
    puts "Rooms in this game:"
    current_game.rooms.each do |room|
      if current_room == room
        puts "#{ room.id } : #{ room.name }*"
      else
        puts "#{ room.id } : #{ room.name }"
      end
    end
    puts ""
  end

  def connect_room_prompt
    puts "Connect to another room, two-way."
    puts "Room ID you'd like to connect to:"
    room = Room.find(gets.chomp.to_i)
    puts "Name for the door"
    outgoing_exit_name = gets.chomp
    puts "Name for the returning door"
    incoming_exit_name = gets.chomp
    current_room.two_way_connect_to(room, outgoing_exit_name, incoming_exit_name)
    puts "Connected this room to #{ room.name } via #{ outgoing_exit_name } and returning via #{ incoming_exit_name}"
  end

  def dig_room_prompt
    puts "Digging a room and connecting to it in both directions..."
    puts "Name for the new room:"
    room_name = gets.chomp
    puts "Description for the new room:"
    room_desc = gets.chomp
    puts "Exit name for this room to the new room:"
    outgoing_exit_name = gets.chomp
    puts "Exit name for the new room to this room:"
    incoming_exit_name = gets.chomp
    puts ""
    puts "Confirm:"
    puts ""
    puts "New room:"
    puts room_name
    puts room_desc
    puts ""
    puts "Connects to #{current_room.name} via #{outgoing_exit_name} and returning via #{incoming_exit_name}"
    puts "y/n"
    case gets.chomp.downcase
    when "y"
      new_room = Room.create(name: room_name, description: room_desc, game: current_game)
      new_room.two_way_connect_to(current_room,  incoming_exit_name, outgoing_exit_name)
    end
  end

  def teleport
    puts "ID to teleport to:"
    room_id = gets.chomp

    puts "Room id #{room_id}"
    if current_game.room_ids.include?(room_id.to_i)
      player.update_attributes(room_id: room_id.to_i)
      exit_build_mode
    else
      puts "That's not a valid room!"
      build_mode_menu
      get_build_input
    end
  end

  def exit_build_mode
    puts "Exiting build mode"
    ""
    look
  end
end