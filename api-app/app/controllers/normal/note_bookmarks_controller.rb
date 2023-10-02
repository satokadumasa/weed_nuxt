class Normal::BoardCommentsController < NoteBookmarksController
  before_action :authenticate_user!
end
