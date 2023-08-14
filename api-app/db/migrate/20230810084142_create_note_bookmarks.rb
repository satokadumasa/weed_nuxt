class CreateNoteBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :note_bookmarks do |t|
      t.integer :note_id
      t.integer :user_id

      t.timestamps

    end
    add_index :note_bookmarks, :note_id
    add_index :note_bookmarks, :user_id
    add_index :note_bookmarks, [:note_id, :user_id], unique: true
  end
end
