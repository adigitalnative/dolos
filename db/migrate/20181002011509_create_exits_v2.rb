class CreateExitsV2 < ActiveRecord::Migration[5.2]
  def change
    create_table :exits do |t|
      t.timestamps
    end
  end
end
