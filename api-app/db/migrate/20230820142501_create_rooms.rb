class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :user_id
      t.text :overview

      t.timestamps
    end
    # add_index :rooms, :name
    # add_index :rooms, :user_id
  end
end
