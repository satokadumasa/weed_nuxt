class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token, raise: false
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:uid, :nickname, :email, :password, :password_confirmation])
  end

  def login_user
    begin
      authenticate_user!
    rescue => exception
      begin
        authenticate_admin!
      rescue => exception
        exception
      end
    end
  end
end
