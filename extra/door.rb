class Door < ActiveRecord::Base
  belongs_to :room
  belongs_to :exit
end