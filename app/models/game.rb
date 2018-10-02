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
    setup_starting_rooms
    rooms << @starting_room
    player = Player.create(room: @starting_room, game: self)
  end

  def setup_starting_rooms
    @starting_room = Room.create(name: "The First Room", description: "A great room", game: self)
    second_room = Room.create(name: "The second room", description: "Another room", game: self)
    @starting_room.connect_to(second_room, "East")
    second_room.connect_to(@starting_room, "West")
  end

  def current_game
    self
  end
end