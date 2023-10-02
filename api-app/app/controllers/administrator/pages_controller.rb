class Administrator::PagesController < PagesController
  before_action :authenticate_admin!
end
