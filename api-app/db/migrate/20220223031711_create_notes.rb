class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :title, limit: 64
      t.text :overview
      t.text :detail

      t.timestamps
    end
    add_index :notes, :user_id
    add_index :notes, :title
  end
end
