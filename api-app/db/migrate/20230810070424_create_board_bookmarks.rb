class CreateBoardBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :board_bookmarks do |t|
      t.integer :board_id
      t.integer :user_id

      t.timestamps
    end
    add_index :board_bookmarks, :board_id
    add_index :board_bookmarks, :user_id
    add_index :board_bookmarks, [:board_id, :user_id], unique: true
  end
end
