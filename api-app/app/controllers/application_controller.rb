class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token, raise: false
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:uid, :nickname, :email, :password, :password_confirmation])
  end
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # skip_before_action :verify_authenticity_token
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #         devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
  # skip_before_action :verify_authenticity_token, if: :devise_controller?
  # before_action :authenticate_account!, unless: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller? 
  # before_action :split_tokens
  # prepend_after_action :join_tokens

  # respond_to :json

  # private

  #   def devise_token_auth_controller?
  #     params[:controller].split('/')[0] == 'devise_token_auth'
  #   end

  #   def configure_permitted_parameters
  #     # DBにaccounts.nameカラムがある場合
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #     devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  #   end
  
  #   def split_tokens
  #     return if request.headers['X-Access-Token'].nil?
  
  #     token = JSON.parse(Base64.decode64(CGI.unescape(request.headers['X-Access-Token'])))
  #     request.headers['access-token'] = token['access-token']
  #     request.headers['client'] = token['client']
  #     request.headers['uid'] = token['uid']
  #   end
  
  #   def join_tokens
  #     return if response.headers['access-token'].nil?
  
  #     auth_json = {
  #       'access-token' => response.headers['access-token'],
  #       'client' => response.headers['client'],
  #       'uid' => response.headers['uid'],
  #     }
  #     response.headers.delete_if{|key| auth_json.include? key}
  #     response.headers['X-Access-Token'] = CGI.escape(Base64.encode64(JSON.dump(auth_json)))
  #   end
end
