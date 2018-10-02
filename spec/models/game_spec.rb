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
    it "creates a starting room tied to the game" do
      expect(@game.rooms.count).to eq(1)
    end

    it "creates a player object" do
      expect(@game.player.class).to eq(Player)
    end

    it "sets the player object's starting location to the created room" do
      expect(@game.player.room.class).to eq(Room)
    end
  end
end