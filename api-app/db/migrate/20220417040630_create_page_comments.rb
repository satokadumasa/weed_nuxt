class CreatePageComments < ActiveRecord::Migration[6.1]
  def change
    create_table :page_comments do |t|
      t.integer :user_id
      t.integer :page_id
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
