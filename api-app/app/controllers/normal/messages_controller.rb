class Normal::MessagesController < MessagesController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
end
