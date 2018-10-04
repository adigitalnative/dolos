require 'spec_helper'

describe "PlayerActions" do
  before(:each) do
    @game = FactoryBot.create(:game, name: "The Game")
    Item.create(name: "Rope", description: "10ft sturdy rope", game: @game, owner: @game.player)
    Item.create(name: "Key1", description: "Your starting key", game: @game, owner: @game.current_room)
  end
  


  context ".look" do
    it "prints the room title" do
      expect {@game.look}.to output(/The First Room/).to_stdout
    end

    it "prints the room description" do
      expect {@game.look}.to output(/A great room/).to_stdout
    end

    it "prints the available exits" do
      expect {@game.look}.to output(/Exits: East/).to_stdout
    end
    
    it "prints the items in the room" do
      expect {@game.look}.to output(/Room items: Key1/).to_stdout
    end
    
  end
  
  context ".pickup_item" do
    it "sets the current room's params as the params" do
      expect {@game.pickup_item('key1')}.to output(/Pickedup Key1/).to_stdout
      expect {@game.inventory}.to output(/Key1/).to_stdout
    end
  end

  context ".drop_item" do
    it "saves any new_room_params to the database for the current room" do
      expect {@game.drop_item('rope')}.to output(/Droped Rope/).to_stdout
      expect {@game.look}.to  output(/Rope/).to_stdout
    end
  end
end