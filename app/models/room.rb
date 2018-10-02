class Room < ActiveRecord::Base
  has_many :entrances, class_name: "Door", foreign_key: "room_outgoing_id"
  has_many :exits, class_name: "Door", foreign_key: "room_incoming_id"
  has_many :exit_rooms, through: :exits,  source: :exit
  has_many :entrance_rooms, through: :entrances,  source: :entrance

  def connect_to(other_room, name="A door")
    # creates a door leading to self
    Door.create(name: name, room_incoming_id: self.id, room_outgoing_id: other_room.id)
  end
end