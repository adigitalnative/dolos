class AddPlayerToGame < ActiveRecord::Migration[5.2]
  def change
    add_reference :games, :player
  end
end
