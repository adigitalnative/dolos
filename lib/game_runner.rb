module Dolos

end

class Dolos::GameRunner

  def run
    welcome_user
    new_game_prompt
    if saved_games?
      load_game_prompt
    end
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
        puts "Loading game #{game.name}"
        @game.load
      else
        puts "There is no game to load... type 'help' for help"
        process_input
      end
    else
      process_input
    end
  end

  def display_help_menu
    puts "Available Commands"
    puts "help...............Display this menu"
    puts "exit...............Leave the game"
    process_input
  end

  def welcome_user
    puts "Welcome to the game"
    puts "Type 'help' at any time for a list of available commands"
  end

  def new_game_prompt
    puts "Would you like to start a new game? (new):"
  end

  def load_game_prompt
    puts "Would you like to load a saved game? (load)"
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