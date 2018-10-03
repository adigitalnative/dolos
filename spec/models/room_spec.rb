require 'spec_helper'

def test_reset
  Door.destroy_all
  Room.destroy_all
  Item.destroy_all
end

RSpec.describe "A Room" do
  before(:all) do
    test_reset
    @room = Room.create(name: "Room One", description: "Room One Description foo")
    @room_two = Room.create(name: "Room Two")
  end
  it "has a name" do
    expect(@room.name).to eq("Room One")
  end

  it "has a description" do
    expect(@room.description).to eq("Room One Description foo")
  end

  it "has exits" do
    expect(@room).to respond_to(:exits)
  end

  context ".connect_to(room, outgoing_name, incoming_name)" do
    it "succeeds in connecting two rooms" do
      room_count = @room.exits.count
      @room.connect_to(room: @room_two, outgoing_name: "East", incoming_name: "West")
      expect(@room.exits.count).to eq(room_count + 2)
    end
  end
end