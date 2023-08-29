class Auth::SessionsController < DeviseTokenAuth::SessionsController
    def create
        pp "Auth::SessionsController::create"
        user = super
        user = JSON.parse(user)
        # user2[:user] = user[:data]
        # pp "user:" << user2.to_s
    end
    def destroy # Assumes only JSON requests
        pp "Auth::SessionsController::destroy"
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {
            'csrfParam' => request_forgery_protection_token,
            'csrfToken' => form_authenticity_token
        }
    end
end
