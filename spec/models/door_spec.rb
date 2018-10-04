require 'spec_helper'

RSpec.describe "Door" do
  before(:each) do
    @room1 = Room.create(name: "Room One", description: "Room One Description foo")
    @room2 = Room.create(name: "Room Two", description: "Room Twp Description Bar")
    @door=@room1.connect_to(@room2, "The name", "shortcut")
  end

  it ".name returns the name" do
    expect(@door.name).to eq("The name")
  end

  it ".description returns nil before adding description and the description after" do
    expect(@door.description).to eq(nil)
    @door.description=("A door")
    expect(@door.description).to eq("A door")
  end

  it ".entrance and .exit returns rooms" do
    expect(@door.entrance).to eq(@room2)
    expect(@door.exit).to eq(@room1)
  end

  it "has a shortcut command" do
    expect(@door.shortcut).to eq("shortcut")
  end
end