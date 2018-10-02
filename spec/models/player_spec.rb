require 'spec_helper'

RSpec.describe "Player" do
  before do
    @room = FactoryBot.create(:room, name: "The cool room", description: "A room description goes here.")
    @player = FactoryBot.create(:player, room: @room)
  end

  context ".look" do
    it "prints the room title" do
      expect {@player.look}.to output(/The cool room/).to_stdout
    end

    it "prints the room description" do
      expect {@player.look}.to output(/A room description goes here/).to_stdout
    end

    it "prints the available exits"
  end
end