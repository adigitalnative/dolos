class AddGameIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :game
  end
end
