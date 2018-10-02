class Room < ActiveRecord::Base
  has_many :doors
  has_many :exits, through: :doors

  def connect(other_room, outgoing_name, incoming_name)
    the_exit = Exit.create
    Door.create(name: outgoing_name, room: self, exit: the_exit)
    Door.create(name: incoming_name, room: other_room, exit: the_exit)
  end
end