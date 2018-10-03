class Item < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  belongs_to :game
end