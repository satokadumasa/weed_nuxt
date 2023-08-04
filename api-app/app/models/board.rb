class Board < ApplicationRecord
  has_many :board_comments
  belongs_to :user
end
