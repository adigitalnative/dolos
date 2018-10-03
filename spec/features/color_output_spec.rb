require 'spec_helper'

describe "ColorOutput" do
  context ".parse_for_color(string)" do

    it "returns the same string if there are no color codes" do
      expect(Game.parse_for_color("foo")).to eq("foo")
    end

    it "returns a colorized parsed string" do
      expect(Game.parse_for_color("Text %color:red to color"))
    end

    it "returns a string that is identical to the input string except for color"

    it "returns a string with the color back to default"
  end

  context ".has_colors?" do
    before do
      @color_string = "This is some text %color:foo - WITH COLOR"
      @plain_string = "This is some text WITH NO COLOR"
    end

    it "returns true if there is a color code" do
      expect(Game.has_colors?(@color_string)).to eq(true)
    end

    it "returns false for no color codes" do
      expect(Game.has_colors?(@plain_string)).to eq(false)
    end

  end
end