require 'spec_helper'

RSpec.describe "Item" do
  before(:each) do
    @room1 = Room.create(name: "Room One", description: "Room One Description foo")
    @room2 = Room.create(name: "Room Two", description: "Room Twp Description Bar")
    @item1 =Item.create(name: "A thing", description: "stuff")
    @item1.owner=@room2
  end

  it ".name returns the name" do
    expect(@item1.name).to eq("A thing")
  end

  it ".description is stuff" do
    expect(@item1.description).to eq("stuff")
  end

  it "has owner" do
    expect(@item1.owner).to eq(@room2)
  end
  
  it "owner transfers" do
    @item1.owner=@room1
    expect(@item1.owner).to eq(@room1)
  end
  
end