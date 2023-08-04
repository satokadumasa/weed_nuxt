class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.string :title, limit: 64
      t.text :detail

      t.timestamps
    end
    add_index :boards, :user_id
    add_index :boards, :title
  end
end
