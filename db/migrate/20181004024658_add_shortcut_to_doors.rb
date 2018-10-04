class AddShortcutToDoors < ActiveRecord::Migration[5.2]
  def change
    add_column :doors, :shortcut, :string
  end
end
