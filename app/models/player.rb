class Player < ActiveRecord::Base

  has_many :items, as: :owner
  belongs_to :room
  belongs_to :game

end