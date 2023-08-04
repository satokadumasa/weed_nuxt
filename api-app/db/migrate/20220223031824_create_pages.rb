class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.integer :note_id
      t.string :title, limit: 64
      t.text :overview
      t.text :detail

      t.timestamps
    end
    add_index :pages, :user_id
    add_index :pages, :note_id
    add_index :pages, :title
  end
end
