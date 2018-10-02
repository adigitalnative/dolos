class AddGameIdToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :game
  end
end
