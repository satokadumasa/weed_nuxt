class CreateBoardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :board_comments do |t|
      t.integer :user_id
      t.integer :board_id
      t.string :title, limit: 64
      t.text :detail

      t.timestamps
    end
    add_index :board_comments, :user_id
    add_index :board_comments, :board_id
    add_index :board_comments, :title
  end
end
