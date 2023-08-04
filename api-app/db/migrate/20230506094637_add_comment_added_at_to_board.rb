class AddCommentAddedAtToBoard < ActiveRecord::Migration[6.1]
  def change
    add_column :boards, :comment_added_at, :timestamp
    add_index :boards, :comment_added_at
  end
end
