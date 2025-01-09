class Normal::NoteBookmarksController < NoteBookmarksController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
