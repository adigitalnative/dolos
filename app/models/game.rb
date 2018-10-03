class Game < ActiveRecord::Base
  include PlayerActions
  include EditorActions
  include BuilderActions
  extend ColorOutput

  has_many :rooms
  has_one :player

  after_create :setup_game

  def load
    puts "Loading........."
    sleep(0.5)
    puts "Welcome to the game."
    look
    parse_input
  end

  def setup_game
    setup_starting_rooms
    rooms << @starting_room
    player = Player.create(location: @starting_room, game: self)
  end

  def setup_starting_rooms
    @starting_room = Room.create(name: "The First Room", description: "A great room", game: self)
    second_room = Room.create(name: "The second room", description: "Another room", game: self)
    @starting_room.two_way_connect_to(second_room, "East", "West")
  end

  def current_game
    self
  end

  def current_room
    player.location
  end

  def room_ids
    rooms.map do |room|
      room.id
    end
  end


end