require 'spec_helper'

RSpec.describe "Door" do
  before(:all) do
    @room = FactoryBot.create(:room)
    # @exit = FactoryBot.create(:exit)
    @door = FactoryBot.create(:door, name: "The name", description: "A door", room: @room)
  end

  it ".name returns the name" do
    expect(@door.name).to eq("The name")
  end

  it ".description returns the description" do
    expect(@door.description).to eq("A door")
  end

  it ".room returns a room" do
    expect(@door.room).to eq(@room)
  end

  it ".exit returns an exit" do
    # expect(@door.exit).to eq(@exit)
  end
end