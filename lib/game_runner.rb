module Dolos

end

class Dolos::GameRunner

  def run
    welcome_user
    process_main_menu_input
  end

  def menu_process_input
    puts ""
    print "\e[0;32;49m» \e[0m"
    input = gets.chomp

    case input.downcase
    when "help" || "h"
      display_help_menu
    when "exit" || "e"
      exit_game
    else
      input
    end

  end

  def process_main_menu_input
    input = menu_process_input

    case input.downcase
    when "new"
      create_and_begin_new_game
    when "load"
      if saved_games?
        prompt_for_saved_game
      else
        puts "There is no game to load... type 'help' for help"
        process_main_menu_input
      end
    when "delete"
      prompt_for_game_to_delete
    else
      process_main_menu_input
    end
  end

  def prompt_for_saved_game
    available_games = []
    puts "Please select a previous game:"
    Game.all.each do |game|
      available_games << game.id
      puts "#{game.id}: #{game.name}"
    end

    input = menu_process_input
    input = input.to_i

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
      process_main_menu_input
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
    process_main_menu_input
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
    puts "\e[0;33;49mType '\e[0;93;49mhelp\e[0;33;49m' at any time for a list of available commands\e[0m"
    puts ""
    display_main_menu
  end

  def display_main_menu
    new_game_prompt
    if saved_games?
      load_game_prompt
    end
  end

  def new_game_prompt
    puts "\e[0;36;49mWould you like to start a new game? (\e[0;96;49mnew\e[0;36;49m)\e[0m"
  end

  def load_game_prompt
    puts "\e[0;36;49mWould you like to load a saved game? (\e[0;96;49mload\e[0;36;49m)\e[0m"
    puts "\e[0;36;49mWould you like to delete a saved game? (\e[0;96;49mdelete\e[0;36;49m)\e[0m"
  end

  def exit_game
    puts ""
    puts "Goodbye! See you next time."
    puts ""
    sleep(0.5)
    exit
  end

  def create_and_begin_new_game
    puts "\e[0;97;49mName your new game:\e[0m"
    name = gets.chomp
    @game = Game.create(name: name)
    @game.load
  end

  private

  def saved_games?
    Game.count > 0
  end
end