class Auth::SessionsController < DeviseTokenAuth::SessionsController
    def create
        user = super
        user = JSON.parse(user)
        pp "ssss:" << user[:data].inspect
        # user2[:user] = user[:data]
        # pp "user:" << user2.to_s
    end
    def destroy # Assumes only JSON requests
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {
            'csrfParam' => request_forgery_protection_token,
            'csrfToken' => form_authenticity_token
        }
    end
end
