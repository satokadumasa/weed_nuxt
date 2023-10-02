class Normal::BoardCommentsController < BoardBookmarksController
  before_action :authenticate_user!
end
