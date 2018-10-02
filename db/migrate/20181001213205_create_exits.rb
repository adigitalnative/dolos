class CreateExits < ActiveRecord::Migration[5.2]
  def change
    create_table :exits do |t|
      t.string    :name, null: false
      t.string    :description
      t.references :room
      t.references :passage
      t.timestamps
    end
  end
end
