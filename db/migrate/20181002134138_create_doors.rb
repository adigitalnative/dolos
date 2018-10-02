class CreateDoors < ActiveRecord::Migration[5.2]
  def change
    create_table :doors do |t|
      t.string    :name, null: false
      t.string    :description
      t.integer :room_incoming_id
      t.integer :room_outgoing_id 
      t.timestamps
    end
  end
end
