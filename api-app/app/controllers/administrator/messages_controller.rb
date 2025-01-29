class Administrator::MessagesController < MessagesController
  before_action :authenticate_admin!
end
