class Normal::BoardsController < BoardsController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
