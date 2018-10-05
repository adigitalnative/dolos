module ItemCreatorActions

  def enter_item_creator_mode
    @new_item_owner=player
    puts "Entering Item Creator"
    get_make_input
  end


  def item_creator_menu
    puts "Item Creator: Available Commands"
    puts "make...............dig a new item"
    puts "owner...............change new item owner (Current new item owner: #{@new_item_owner.class} ID: #{@new_item_owner.id})"
    puts "list..............list all items"
  end

  def get_make_input
    item_creator_menu
    print "\e[0;32;49m» \e[0m"
    input = gets.chomp
    case input.downcase
    when "list"
      list_game_items
      get_make_input
    when "make"
      make_item_prompt
      get_make_input
    when "owner"
      set_owner
      get_make_input
    when "exit"
      exit_make_mode
    else
      get_make_input
    end
  end

  def list_game_items
    puts "items in this game:"
    current_game.items.each do |item|
        puts "#{ item.id } : #{ item.name }"
    end
    puts ""
  end

  def make_item_prompt
    puts "Name for the new item:"
    item_name = ColorOutput.parse_for_color(gets.chomp)
    puts "Description for the new item:"
    item_desc = ColorOutput.parse_for_color(gets.chomp)
    puts ""
    puts "Confirm:"
    puts ""
    puts "New item:"
    puts item_name
    puts item_desc
    puts ""
    puts "y/n"
    case gets.chomp.downcase
    when "y"
      Item.create(name: item_name, description: item_desc, game: current_game, owner: @new_item_owner)
    end
  end
  
  def set_owner
    puts "Chose owner type:"
    puts "player"
    puts "room"
    input = gets.chomp
    case input.downcase
    when "player"
      puts "Owner set to player"
      return true
    when "room"
      return select_room
    end
    puts "Invalid owner type"
  end
  
  def select_room
    puts "Display room list? y/n"
    case gets.chomp.downcase
    when "y"
      puts "Rooms:"
      current_game.rooms.each{|room| puts "ID: #{room.id} Name: #{room.name} "} 
    end
    puts "Room ID to select:"
    
    room_id = gets.chomp
    puts "Room id #{room_id}"
    if current_game.room_ids.include?(room_id.to_i)
      @new_item_owner=Room.find(room_id)
    else
      puts "That's not a valid room!"
    end
  end
  
  def exit_make_mode
    puts "Exiting Item Creator"
    look
    parse_input
  end
end