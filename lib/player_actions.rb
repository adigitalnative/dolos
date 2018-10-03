module PlayerActions
  def parse_input
    @input1 = gets.chomp.downcase
    @input2 = @input1.split(" ", 2).last
    case @input1.split(" ").first
    when "exit"
      exit_game
    when "move"
      move(@input2)
    when "look"
      look
    when "menu"
      return_to_menu
    when "help"
      help
    when "edit"
      if @input2 == "room"
        edit_room
      end
    when "pickup"
      pickup_item(@input2)
    when "drop"
      drop_item(@input2)
    when "inv"
      inventory
    end
    parse_input
  end

  def look
    puts "**********************************************************************"
    puts current_room.name
    puts ""
    puts current_room.description
    puts current_room.list_exits
    puts current_room.list_items
  end

  def help
    puts "Available Commands"
    puts "look.................display the current room"
    puts "move <exit>..........move through a specific exit"
    puts "edit room............go into room editor"
    puts "menu.................back to game menu"
    puts "pickup <item>.................picksup an item from the room"
    puts "drop <item>.................dop an item from inventory to the room"
    puts "inv.................display player inventory"
    puts "exit.................exit the game"
    
  end

  def return_to_menu
    puts "Your location will be saved for the next time you play."
    Dolos::GameRunner.new.run
  end

  def exit_game
    puts "Goodbye!"
    return exit
  end

  def move(exit_string)
    door = current_room.exits.find {|door| door.name.downcase == exit_string }
    if door
      player.update_attributes(location:door.entrance)
      look
    else
      puts "That's not an exit!"
    end
  end
  
  def pickup_item(item_string)
    item = current_room.items.find {|el| el.name.downcase == item_string }
    if item and item.owner==current_room
      item.owner=player
      item.save
      puts "Pickedup #{item.name}"
    else
      puts "No item to pickup."
    end
  end
  
  def drop_item(item_string)
    item = player.items.find {|el| el.name.downcase == item_string }
    if item and item.owner==player
      item.owner=current_room
      item.save
      puts "Droped #{item.name}"
    else
      puts "No item to drop."
    end
  end
  
  def inventory
    puts "Items:"
    # binding.pry
    player.items.select{|item| item.owner==player}.each {|item| puts "#{item.name} - Description: #{item.description}"}
  end
  
end