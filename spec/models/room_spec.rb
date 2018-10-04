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

  context ".connect_to(room, outgoing_name, shortcut)" do
    it "succeeds in connecting two rooms" do
      room_count = @room.exits.count
      @room.connect_to(@room_two, "East", "east")
      expect(@room.exits.count).to eq(room_count + 1)
    end

    it "defaults the shortcut to the name if no shortcut is provided" do
      @room.connect_to(@room_two, "Foo exit")
      expect(@room.exits.find_by(name: "Foo exit").shortcut).to eq("Foo exit")
    end
  end

  context ".two_way_connect_to(second_room:, outgoing_name:, incoming_name:)" do
    it "succeeds with valid input" do
      room_count = @room.exits.count
      room_three = FactoryBot.create(:room)
      @room.two_way_connect_to(room_three, "North", "South")
      expect(@room.list_exits).to match(/North/)
      expect(room_three.list_exits).to match(/South/)
    end
  end


end