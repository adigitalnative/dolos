require 'spec_helper'

RSpec.describe "Game" do
  before(:all) do
    player = FactoryBot.create(:player)
    @game = FactoryBot.create(:game, name: "The Game")
  end

  context "attributes" do
    it "has a name" do
      expect(@game.name).to eq("The Game")
    end
  end

  context ".load" do
    before do
      @player
    end

    it "loads the game" do
      expect { @game.load() }.to output(/Welcome to the game/).to_stdout
    end
  end

  context ".setup_game" do
    it "creates starting rooms tied to the game" do
      expect(@game.rooms.count).to be > 0
    end

    it "creates a player object" do
      expect(@game.player.class).to eq(Player)
    end

    it "sets the player object's starting location to the created room" do
      expect(@game.player.room.class).to eq(Room)
    end
  end

  context ".setup_starting_rooms" do
    it "sets up two rooms" do
      initial_room_count = @game.rooms.count
      @game.setup_starting_rooms
      expect(@game.rooms.count).to eq(initial_room_count + 2)
    end
    
    it "connects the rooms" do

    end
  end

  context ".look" do
    it "prints the room title" do
      expect {@game.look}.to output(/The First Room/).to_stdout
    end

    it "prints the room description" do
      expect {@game.look}.to output(/A great room/).to_stdout
    end

    it "prints the available exits"
  end

  context ".current_room" do
    it "returns a room" do
      expect(@game.current_room.class).to eq(Room)
    end
  end
end