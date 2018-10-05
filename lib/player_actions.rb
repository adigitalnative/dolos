module PlayerActions
  def parse_input
    StyleElement.prompt_cue
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
      if @input2 == 'item'
        edit_item
      end
    when "pickup"
      pickup_item(@input2)
    when "drop"
      drop_item(@input2)
    when "inv"
      inventory
    when "build"
      enter_build_mode
    when "make"
      enter_item_creator_mode
    end
    parse_input
  end

  def look
    puts ""
    StyleElement.divider
    puts current_room.name.center(StyleElement.game_width)
    StyleElement.divider
    puts ""
    puts current_room.description.center(StyleElement.game_width)
    puts ""
    StyleElement.divider
    puts ""
    puts current_room.list_exits
    puts current_room.list_items
    puts ""
  end

  def help
    puts ""
    puts "Available Commands".center(StyleElement.game_width)
    StyleElement.menu_divider
    puts ""
    StyleElement.menu_doc("look", "display the current room")
    StyleElement.menu_doc("move <exit>", "move through a specfic exit")
    StyleElement.menu_doc("edit room", "go into room editor")
    StyleElement.menu_doc("edit item", "go into item editor")
    StyleElement.menu_doc("build", "enter build mode")
    StyleElement.menu_doc("make", "enter make mode")
    StyleElement.menu_doc("menu", "back to game menu")
    StyleElement.menu_doc("pickup <item>", "picks up an item")
    StyleElement.menu_doc("drop <item>", "drop an item")
    StyleElement.menu_doc("inv", "display player inventory")
    StyleElement.menu_doc("exit", "exit the game")
    puts ""
  end

  def return_to_menu
    puts ""
    puts "Your location will be saved for the next time you play."
    puts ""
    sleep(1)
    Dolos::GameRunner.new.run
  end

  def exit_game
    puts "Goodbye!"
    return exit
  end

  def move(exit_string)
    door = current_room.exits.find {|door| door.shortcut && door.shortcut.downcase == exit_string }
    if door
      player.update_attributes(location:door.entrance)
      look
    else
      puts "That's not an exit!"
    end
  end
  
  def pickup_item(item_string)
    item = current_room.items.find {|el| el.name.downcase == item_string }
    if item
      item.owner=player
      item.save
      puts "Picked up #{item.name}"
    else
      puts "No item to pickup."
    end
  end
  
  def drop_item(item_string)
    item = player.items.find {|el| el.name.downcase == item_string }
    if item
      item.owner=current_room
      item.save
      puts "Dropped #{item.name}"
    else
      puts "You don't have #{item_string}."
    end
  end
  
  def inventory
    puts "Items:"
    player.items.each {|item| puts "#{item.name} - Description: #{item.description}"}
  end
  
end