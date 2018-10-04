require 'spec_helper'

RSpec.describe "Starting the app" do
  before(:each) do
    @game_runner = Dolos::GameRunner.new
  end

  it "welcomes the user" do
    expect { @game_runner.welcome_user }.to output(/Welcome to the game/).to_stdout
  end

  it "exits on 'exit'" do
    expect {@game_runner.exit}.to output(/Goodbye/).to_stdout
  end

  context ".display_help_menu" do
    before(:each) do
      @game_runner.stub(:gets) {"exit"}
    end

    it "outputs a help menu" do
      expect { @game_runner.display_help_menu }.to output(/Available Commands/).to_stdout
    end

    it "includes 'exit'" do
      expect { @game_runner.display_help_menu }.to output(/exit/).to_stdout
      expect { @game_runner.display_help_menu }.to output(/Leave the game/).to_stdout
    end

    it "includes 'help'" do
      expect { @game_runner.display_help_menu }.to output(/help/).to_stdout
      expect { @game_runner.display_help_menu }.to output(/Display this menu/).to_stdout
    end
  end

  context "when there is no existing game" do
    it "asks user if they'd like to start a new game" do
      expect { @game_runner.new_game_prompt }.to output(/start a new game/).to_stdout
    end
  end

  context "when there is an existing game" do
    before(:each) do
      @game_one = FactoryBot.create(:game)
    end

    it "asks the user if they'd like to load a saved game (load)" do
      expect { @game_runner.load_game_prompt }.to output(/load a saved game/).to_stdout
    end
  end
end 