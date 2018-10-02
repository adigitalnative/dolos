class AddGameIdToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :game
  end
end
