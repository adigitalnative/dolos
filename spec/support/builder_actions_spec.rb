require 'spec_helper'

RSpec.describe "Game" do
  context "build_mode_menu" do
    it "returns a reasonable menu"
  end

  context "list_game_rooms" do
    it "includes rooms associated with the current game"
    it "does not include rooms associated with other games"
  end

  context ".connect_room_prompt" do
    it "creates a one-way passage between the current room and another room"
  end
end