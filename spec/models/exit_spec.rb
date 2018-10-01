require 'spec_helper'

RSpec.describe "An exit" do
  before(:all) do
    @exit = Exit.create(name: "The name", description: "A door")
  end

  it "has a name" do
    expect(@exit.name).to eq("The name")
  end

  it "has a description" do
    expect(@exit.description).to eq("A door")
  end

  it "has a room" do
    expect(@exit).to respond_to(:room)
  end

  it "has a passage" do
    expect(@exit).to respond_to(:passage)
  end
end