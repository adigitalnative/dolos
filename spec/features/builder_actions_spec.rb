require 'spec_helper'

RSpec.describe "Game" do
  context "build_mode_menu" do
    it "returns a reasonable menu"
  end

  context "list_game_rooms" do
    before do
      @game = FactoryBot.create(:game)
    end
    xit "outputs the game's rooms" do
      #Weird
    end
    it "includes rooms associated with the current game"
    it "does not include rooms associated with other games"
  end
end