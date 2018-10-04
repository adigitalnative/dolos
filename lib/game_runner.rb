module Dolos

end

class Dolos::GameRunner

  def run
    welcome_user
    process_input
  end

  def process_input
    input = gets.chomp

    case input.downcase
    when "help" || "h"
      display_help_menu
    when "exit" || "e"
      exit
    when "new"
      create_and_begin_new_game
    when "load"
      if saved_games?
        prompt_for_saved_game
      else
        puts "There is no game to load... type 'help' for help"
        process_input
      end
    when "delete"
      prompt_for_game_to_delete
    else
      process_input
    end
  end

  def prompt_for_saved_game
    available_games = []
    puts "Please select a previous game:"
    Game.all.each do |game|
      available_games << game.id
      puts "#{game.id}: #{game.name}"
    end

    input = gets.chomp.to_i

    if available_games.include?(input)
      @game = Game.find(input)
      @game.load
    elsif input == "exit"
      exit
    else
      puts "That's not a valid selection. Please try again"
      prompt_for_saved_game
    end
  end

  def prompt_for_game_to_delete
    available_games = []
    puts "Please select a saved game:"
    Game.all.each do |game|
      available_games << game.id
      puts "#{game.id}: #{game.name}"
    end

    input = gets.chomp.to_i

    if available_games.include?(input)
      @game = Game.find(input)
      @game.destroy
      puts "#{@game.name} deleted."
      puts ""
      menu_prompt
      process_input
    elsif input == "exit"
      exit
    else
      puts "That is not a valid selection. Please try again"
      prompt_for_game_to_delete
    end
  end

  def display_help_menu
    puts "Available Commands"
    puts "help...............Display this menu"
    puts "new................Start a new game"
    puts "load...............Load a saved game"
    puts "exit...............Leave the game"
    process_input
  end

  def pretty_divider
    base_array = ["\e[0;31;49m•\e[0m", "\e[0;37;49m•\e[0m", "\e[0;34;49m•\e[0m"].join()
    full_array = []
    20.times { full_array << base_array }
    puts full_array.join
  end

  def welcome_user
    puts ""
    pretty_divider
    puts ""
    puts "Dolos".colorize(:light_white).center(70)
    puts ""
    pretty_divider
    puts ""
    puts "Type 'help' at any time for a list of available commands"
    menu_prompt
  end

  def menu_prompt
    new_game_prompt
    if saved_games?
      load_game_prompt
    end
  end

  def new_game_prompt
    puts "Would you like to start a new game? (new):"
  end

  def load_game_prompt
    puts "Would you like to load a saved game? (load)"
    puts "Would you like to delete a saved game? (delete)"
  end

  def exit
    puts "Goodbye! See you next time."
  end

  def create_and_begin_new_game
    puts "Name your new game:"
    name = gets.chomp
    @game = Game.create(name: name)
    @game.load
  end

  private

  def saved_games?
    Game.count > 0
  end
end