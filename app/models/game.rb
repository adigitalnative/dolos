class Game < ActiveRecord::Base
  include PlayerActions
  include EditorActions
  include BuilderActions
  include ItemCreatorActions
  include ItemEditorActions
  

  has_many :rooms
  has_one :player

  after_create :setup_game

  def load
    puts ""
    progress_bar
    puts ""
    look
    parse_input
  end

  def progress_bar
    progressbar = ProgressBar.create(format: "\e[0;97;49m%t \e[0;90;49m|\e[0;31;49m%b\e[0;90;49m>>\e[0m", title: "Loading Game", total: 60, length: 60)
    60.times { progressbar.increment; sleep 0.01 }
  end

  def setup_game
    setup_starting_rooms
    rooms << @starting_room
    Player.create(location: @starting_room, game: self)
  end

  def setup_starting_rooms
    @starting_room = Room.create(name: "The First Room", description: "A great room", game: self)
    second_room = Room.create(name: "The second room", description: "Another room", game: self)
    @starting_room.two_way_connect_to(second_room, "East", "east", "West", "west")
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
  
  def item_ids
    items.map do |item|
      item.id
    end
  end
  
  def items
    Item.all.select{|item| item.game==self}
  end

end