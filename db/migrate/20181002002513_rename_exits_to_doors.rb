class RenameExitsToDoors < ActiveRecord::Migration[5.2]
  def change
    rename_table :exits, :doors
    rename_column :doors, :passage_id, :exit_id
  end
end
