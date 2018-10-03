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
    puts ""
  end

  def get_build_input
    input = gets.chomp

    case input.downcase
    when "list"
      list_game_rooms
      build_mode_menu
      get_build_input
    end
  end

  def list_game_rooms
    puts "Rooms in this game:"
    current_game.rooms.each do |room|
      puts "#{ room.id } : #{ room.name }"
    end
    puts ""
  end
end