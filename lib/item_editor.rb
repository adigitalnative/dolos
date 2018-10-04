module ItemEditorActions
  attr_accessor :new_item_params
  
  def edit_item
    parse_item_editor_input
  end

  def print_item_edit_options
    puts "What item would you like to edit?"
    puts "item Name (name)"
    puts "item Description (desc)"
    puts "item Owner (owner)"
    puts "Show the item's edited status (status)"
    puts "Save the edited selected item (save)"
    puts "Select a diffrent item (select)"
    puts "Destroy the selected item (destroy)"
    puts "Exit editing mode without saving (exit)"
    puts "Go to game menu (menu)"
  end

  def parse_item_editor_input
    unless @selected_item
      select_item
      return parse_item_editor_input
    end
    print_item_edit_options
    input = gets.chomp.downcase
    case input
    when "pry"
      binding.pry
    when "name"
      edit_item_name
    when "desc"
      edit_item_desc
    when "owner"
      edit_item_owner
    when "status"
      current_item_status
    when "select"
      @selected_item=nil
    when "destroy"
      puts "#{@selected_item.name} destroyed"
      @selected_item.destroy
      @selected_item=nil
    when "exit"
      look
      parse_input
    when "options"
      print_item_edit_options
    when "save"
      puts "item saved"
      save_selected_item
    when "menu"
      return_to_menu
    else
      puts "not a valid answer"
    end
    parse_item_editor_input
  end
  
    
  def select_item
    puts "Select an item by id to edit"
    puts "Display item list? y/n"
    case gets.chomp.downcase
    when "y"
      puts "items:"
      current_game.items.each{|item| puts "ID: #{item.id} Name: #{item.name} "} 
    end
    puts "Item ID to select:"
    item_id=gets.chomp
    puts "Item id #{item_id}"
    if current_game.item_ids.include?(item_id.to_i)
      item=Item.find(item_id)
      @selected_item=item
      set_new_item_params
    else
      puts "That's not a valid item!"
    end
  end

  def current_item_status
    puts "***************************"
    puts "Current item Status"
    puts "***************************"
    puts new_item_params[:name]
    puts new_item_params[:description]
    puts "Owner: #{@new_item_params[:owner].class} ID: #{@new_item_params[:owner].id})}"
    puts "***************************"
  end
  
  def set_new_item_params
    @new_item_params = {
      name: @selected_item.name,
      description: @selected_item.description,
      owner: @selected_item.owner
    }
  end

  def save_selected_item
    @selected_item.update_attributes(new_item_params)
  end
  
  def edit_item_name
    puts "Current item name: #{@selected_item.name}"
    puts "New item name:"
    new_item_params[:name] = ColorOutput.parse_for_color(gets.chomp)
    # puts "item name now: #{new_item_params[:name]}"
  end

  def edit_item_desc
    puts "Current item description: #{@selected_item.description}"
    puts "New item description:"
    new_item_params[:description] = ColorOutput.parse_for_color(gets.chomp)
    # puts "item Description now:"
    # puts "#{new_item_params[:description]}"
  end
end