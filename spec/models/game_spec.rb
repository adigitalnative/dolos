require 'spec_helper'

RSpec.describe "Game" do
  before(:each) do
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

    xit "loads the game" do
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
      expect(@game.player.location.class).to eq(Room)
    end
  end

  context ".setup_starting_rooms" do
    before(:each) do
      @starting_game = FactoryBot.create(:game, name: "Another game")
      @initial_room_count = @starting_game.rooms.count
      @initial_door_count = Door.all.count
      @starting_game.setup_starting_rooms
    end

    it "sets up two rooms" do
      expect(@starting_game.rooms.count).to eq(@initial_room_count + 2)
    end
    
    it "creates two additional doors" do
      expect(Door.all.count).to eq(@initial_door_count + 2)
    end
  end

  context ".current_room" do
    it "returns a room" do
      expect(@game.current_room.class).to eq(Room)
    end
  end
end