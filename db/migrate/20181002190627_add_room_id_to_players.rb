class AddRoomIdToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :room
  end
end
