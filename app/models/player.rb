class Player < ActiveRecord::Base
  has_many :items, as: :owner
end