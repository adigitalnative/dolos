class Game < ActiveRecord::Base

  has_many :rooms
  has_one :player

  after_create :setup_game

  def load
    puts "Loading........."
    sleep(0.5)
    puts "Welcome to the game."
    player.look
  end

  def setup_game
    starting_room = Room.create(name: "The First Room", description: "A great room")
    # Any code to build a starting world would go here.
    rooms << starting_room
    player = Player.create(room: starting_room, game: self)
  end

  def current_game
    self
  end
end