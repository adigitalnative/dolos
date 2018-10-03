class Room < ActiveRecord::Base
  has_many :entrances, class_name: "Door", foreign_key: "room_outgoing_id"
  has_many :exits, class_name: "Door", foreign_key: "room_incoming_id"
  has_many :exit_rooms, through: :exits,  source: :exit
  has_many :entrance_rooms, through: :entrances,  source: :entrance
  has_many :items, as: :ownable
  # has_many :players
  belongs_to :game

  def connect_to(other_room, name="A door")
    Door.create(name: name, room_incoming_id: self.id, room_outgoing_id: other_room.id)
  end

  def list_exits
    exit_array = exits.map do |exit|
      exit.name
    end
    "Exits: #{exit_array.join(", ")}"
  end

  def two_way_connect_to(second_room, outgoing_name, incoming_name)
    # params = {:second_room, :outgoing_name, :incoming_name}
    Door.create(name: outgoing_name, room_incoming_id: self.id, room_outgoing_id: second_room.id)
    Door.create(name: incoming_name, room_incoming_id: second_room.id, room_outgoing_id: self.id)
  end
end