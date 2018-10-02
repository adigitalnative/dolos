require 'spec_helper'

RSpec.describe "A Room" do
  before(:all) do
    test_rest
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
      expect(@room.exits.count).to eq(0)
      @room.connect_to(@room_two, "East")
      expect(@room.exits.count).to eq(1)
    end
  end
end