class Exit < ActiveRecord::Base
  has_many :doors
  has_many :rooms, through: :doors
end