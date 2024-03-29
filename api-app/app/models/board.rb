class Board < ApplicationRecord
  belongs_to :user
  has_many :board_comments
  has_many :board_bookmark_users, through: :board_bookmarks,source: :user
end
