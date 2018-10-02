class Door < ActiveRecord::Base
  belongs_to :exit, class_name: "Room", foreign_key: "room_incoming_id"
  belongs_to :entrance, class_name: "Room", foreign_key: "room_outgoing_id"
end