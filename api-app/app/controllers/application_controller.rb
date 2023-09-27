class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token, raise: false
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:uid, :nickname, :email, :password, :password_confirmation])
  end

  def login_user
    # unless current_user
    #   authenticate_admin!
    #   pp "---------------"
    #   pp "current_admin:" << current_admin.inspect
    #   pp "---------------"
    #   # if(current_admin == nil)
    #   unless current_admin
    #     return render json: {
    #       errors: [I18n.t('devise.failure.unauthenticated')]
    #     }, status: 401
    #   end
    # end
    # true

    # auth_json = {
    #   'access-token' => request.headers['access-token'],
    #   # 'client' => request.headers['client'],
    #   'uid' => request.headers['uid'],
    # }
    auth_json = {"n7M06txJShjYvKuIKP_l-Q":{"token":"$2a$10$GDSuf3GVX1S8zupRA5Ic5uI.5pD.oFONHC0oFXShWlo0lbwusTUby"}}
    token =  CGI.escape(Base64.encode64(JSON.dump(auth_json)))
    # token =  CGI.escape(Base64.encode64(request.headers['access-token']))
    pp "---------------"
    pp token.inspect
    pp "access-token:" << request.headers['access-token']
    pp "token:" << token
    pp "---------------"

  end
  def render_authenticate_error
    pp "---------------"
    pp "render_authenticate_error"
    pp "---------------"
  end
end
