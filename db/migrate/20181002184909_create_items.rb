class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string    :name, null: false
      t.string    :description
      t.integer :owner_id
      t.string  :owner_type
      t.timestamps
    end
  end
end
