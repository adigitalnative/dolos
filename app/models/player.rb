class Player < ActiveRecord::Base

  has_many :items, as: :owner
  belongs_to :room
  belongs_to :game


  def look
    puts room.name
  end
end