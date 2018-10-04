module Dolos

end

class Dolos::GameRunner

  def run
    display_welcome_ascii
    welcome_user
    process_main_menu_input
  end

  def display_welcome_ascii
    ASCIIArt.dolos
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
    puts ""
    puts "Saved Games".colorize(:light_white)
    basic_divider
    Game.all.each do |game|
      available_games << game.id
      puts "#{game.id}: #{game.name}".colorize(:light_white)
    end

    basic_divider
    puts ""
    puts "Please select a previous game:".colorize(:cyan)

    input = menu_process_input
    input = input.to_i

    if available_games.include?(input)
      @game = Game.find(input)
      @game.load
    elsif input == "exit"
      exit_game
    else
      puts "That's not a valid selection. Please try again.".colorize(:red)
      puts "Hint: Use the number, not the name.".colorize(:red)
      prompt_for_saved_game
    end
  end

  def progress_bar_for_delete
    progressbar = ProgressBar.create(format: "\e[0;97;49m%t \e[0;90;49m|\e[0;31;49m%b\e[0;90;49m>>\e[0m", title: "Deleting #{@game.name}", total: 60, length: 60)
    60.times { progressbar.increment; sleep 0.01 }
  end

  def prompt_for_game_to_delete
    available_games = []
    puts ""
    puts "Saved Games".colorize(:light_white)
    basic_divider
    Game.all.each do |game|
      available_games << game.id
      puts "#{game.id}: #{game.name}".colorize(:light_white)
    end

    basic_divider
    puts ""
    puts "Please select a saved game to delete:".colorize(:cyan)

    input = menu_process_input
    input = input.to_i

    if available_games.include?(input)
      @game = Game.find(input)
      @game.destroy
      progress_bar_for_delete
      puts "#{@game.name.capitalize} deleted.".colorize(:red)
      puts ""
      welcome_user
    elsif input == "exit"
      exit_game
    else
      puts "That is not a valid selection. Please try again.".colorize(:red)
      puts "Hint: Use the number, not the name".colorize(:red)
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

  def basic_divider
    string ="."
    divider = ""
    60.times {divider += string}

    puts divider
  end

  def welcome_user
    puts ""
    pretty_divider
    puts ""
    puts "Dolos: A Dungeon Crawling Experiment".colorize(:light_white).center(70)
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