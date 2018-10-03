class Player < ActiveRecord::Base

  has_many :items, as: :owner
  belongs_to :location, class_name: "Room", foreign_key: "room_id"
  belongs_to :game
  
  
  # def room
  #   location
  # end

end