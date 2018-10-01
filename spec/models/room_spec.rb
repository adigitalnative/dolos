require 'spec_helper'

RSpec.describe "A Room" do
  before(:all) do
    @room = FactoryBot.create(:room, name: "Room One", description: "Room One Description foo")
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
end