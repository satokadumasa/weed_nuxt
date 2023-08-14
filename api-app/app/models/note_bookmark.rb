class NoteBookmark < ApplicationRecord
  belongs_to :note
  belongs_to :user
end
