class Normal::BoardCommentsController < NoteBookmarksController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
