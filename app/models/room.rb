class Room < ActiveRecord::Base
  has_many :doors
  has_many :exits, through: :doors
end