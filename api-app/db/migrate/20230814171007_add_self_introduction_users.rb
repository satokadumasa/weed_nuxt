class AddSelfIntroductionUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :self_introduction, :text, after: :nickname, null: true
  end
end
