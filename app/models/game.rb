class Game < ActiveRecord::Base

  belongs_to :player

  def load
    puts "Loading........."
    sleep(0.5)
    puts "Welcome to the game."
  end
end