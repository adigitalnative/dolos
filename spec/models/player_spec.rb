require 'spec_helper'

RSpec.describe "Player" do
  before do
    @room = FactoryBot.create(:room, name: "The cool room")
    @player = FactoryBot.create(:player, room: @room)
  end

  context ".look" do
    it "prints the room title" do
      expect {@player.look}.to output(/The cool room/).to_stdout
    end

    it "prints the room description"
    it "prints the available exits"
  end
end