require 'spec_helper'

RSpec.describe "Exit" do
  before(:all) do
    @exit = FactoryBot.create(:exit)
    @door_one = FactoryBot.create(:door, exit: @exit)
    @door_two = FactoryBot.create(:door, exit: @exit)
    @door_three = FactoryBot.create(:door)
  end

  context ".doors" do
    it "returns an array of doors" do
      expect(@exit.doors).to include(@door_one, @door_two)
    end
    
    xit "errors if someone tries to add more than two doors"
  end
end