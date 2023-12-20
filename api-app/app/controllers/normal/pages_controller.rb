class Normal::PagesController < PagesController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
