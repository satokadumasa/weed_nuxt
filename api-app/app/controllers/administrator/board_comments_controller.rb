class Administrator::BoardCommentsController < BoardCommentsController
  before_action :authenticate_admin!
end
