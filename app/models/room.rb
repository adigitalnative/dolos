class Room < ActiveRecord::Base

  before_save :word_wrap_description

  has_many :entrances, class_name: "Door", foreign_key: "room_outgoing_id"
  has_many :exits, class_name: "Door", foreign_key: "room_incoming_id"
  has_many :exit_rooms, through: :exits,  source: :exit
  has_many :entrance_rooms, through: :entrances,  source: :entrance
  belongs_to :game
  
  def items
    Item.all.select{|item| item.owner==self}
  end


  def connect_to(other_room, name, shortcut=nil)
    shortcut = shortcut || name
    Door.create(name: name, room_incoming_id: self.id, room_outgoing_id: other_room.id, shortcut: shortcut)
  end

  def list_exits
    exit_array = exits.map do |exit|
      exit.name
    end
    "Exits: #{exit_array.join(", ")}"
  end
  
  def list_items
    item_array = items.map do |item|
      item.name
    end
    "Room items: #{item_array.join(", ")}"
  end

  def two_way_connect_to(second_room, incoming_name, incoming_shortcut, outgoing_name, outgoing_shortcut)
    connect_to(second_room, incoming_name, incoming_shortcut)
    second_room.connect_to(self, outgoing_name, outgoing_shortcut)
  end

  def word_wrap_description
    self.description = StyleElement.word_wrap(self.description)
  end
end