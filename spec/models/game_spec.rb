require 'spec_helper'

RSpec.describe "Game" do
  before(:all) do
    player = FactoryBot.create(:player)
    @game = FactoryBot.create(:game, name: "The Game", player: player)
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

    it "has or creates a player" do
      @game.load
      expect(@game.player.class).to eq(Player)
    end
  end
end