class Administrator::BoardsController < BoardsController
  before_action :authenticate_admin!
  def destroy
    pp "Administrator::BoardsController::destroy()"
    super
  end
end
