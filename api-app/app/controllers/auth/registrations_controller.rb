class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
    def create
        # params.uid = params.email
        pp params
        super
    end
    private

    def sign_up_params©
        params.require(:registration).permit(:uid, :nickname, :email, :password, :password_confirmation)
    end
     #ユーザー更新時に使用
    def account_update_params
        params.require(:registration).permit(:name, :registration, :email, :img)
    end
end
