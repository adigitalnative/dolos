require 'spec_helper'

describe "PlayerActions" do
  before(:all) do
    @game = FactoryBot.create(:game)
  end

  context ".pickup_item" do
    xit "sets the current room's params as the params" do

    end
  end

  context ".drop_item" do
    xit "saves any new_room_params to the database for the current room" do

    end
  end
end