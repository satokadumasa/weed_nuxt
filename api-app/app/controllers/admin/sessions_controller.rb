class Admin::SessionsController < DeviseTokenAuth::SessionsController
    def create
        pp "Admin::SessionsController::create"
        user = super
        user = JSON.parse(user)
    end
    def destroy # Assumes only JSON requests
        pp "Admin::SessionsController::destroy"

        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {
            'csrfParam' => request_forgery_protection_token,
            'csrfToken' => form_authenticity_token
        }
    end
    def render_create_success
        pp "Admin::SessionsController::render_create_success"
        render json: {
          data: resource_data(resource_json: @resource.token_validation_response)
        }, scope: :current_admin
    end
end
