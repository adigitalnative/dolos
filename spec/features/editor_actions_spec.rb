require 'spec_helper'

describe "EditorActions" do
  before(:each) do
    @game = FactoryBot.create(:game)
  end

  context ".set_new_room_params" do
    it "sets the current room's params as the params" do
      @game.set_new_room_params
      expect(@game.new_room_params.keys).to include(:name, :description)
      expect(@game.new_room_params.values).to include(@game.current_room.name, @game.current_room.description)
    end
  end

  context ".save_room" do
    it "saves any new_room_params to the database for the current room" do
      @game.set_new_room_params
      @game.new_room_params = {name: "A foo test name foo", description: "A foo test name description"}
      @game.save_room
      expect(@game.current_room.name).to eq("A foo test name foo")
      expect(@game.current_room.description).to eq("A foo test name description")
    end
  end
end