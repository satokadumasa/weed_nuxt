class CreateWhispers < ActiveRecord::Migration[6.1]
  def change
    create_table :whispers do |t|
      t.integer :user_id
      t.integer :room_id
      t.text :body

      t.timestamps
    end
    add_index :whispers, :user_id
    add_index :whispers, :room_id
    add_index :whispers, [:user_id, :room_id], unique: true
  end
end
