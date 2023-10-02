class Normal::BoardCommentsController < BoardCommentsController
  before_action :authenticate_user!
end
