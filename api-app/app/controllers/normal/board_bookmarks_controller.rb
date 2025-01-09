class Normal::BoardBookmarksController < BoardBookmarksController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
