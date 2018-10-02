class RemovePlayerIdFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_reference :games, :player
  end
end
