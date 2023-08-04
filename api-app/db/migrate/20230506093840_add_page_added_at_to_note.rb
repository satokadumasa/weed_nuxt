class AddPageAddedAtToNote < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :page_added_at, :timestamp
    add_index :notes, :page_added_at
  end
end
