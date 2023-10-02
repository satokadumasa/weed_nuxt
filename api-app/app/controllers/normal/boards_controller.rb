class Normal::BoardsController < BoardsController
  before_action :authenticate_user!
end
