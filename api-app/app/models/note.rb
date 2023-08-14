class Note < ApplicationRecord
  has_many :pages
  belongs_to :user
  has_many :note_bookmark_users, through: :note_bookmarks,source: :user
end
