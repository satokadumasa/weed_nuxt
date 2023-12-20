class Normal::BoardCommentsController < BoardCommentsController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
