class Normal::BoardCommentsController < BoardBookmarksController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
