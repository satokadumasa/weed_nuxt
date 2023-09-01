class CreateVchats < ActiveRecord::Migration[7.0]
  def change
    create_table :vchats do |t|
      t.string :name
      t.integer :user_id
      t.text :orverview

      t.timestamps
    end
  end
end
