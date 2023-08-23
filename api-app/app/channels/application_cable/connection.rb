module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # code = cookies.encrypted[:cable]
      # pp "Connection::connect() code:" << code.inspect
      # self.current_user = User.find_by(code: code) if code.present?
      # pp "Connection::connect() params:" << params.inspect

      # self.current_user = find_verified_user
      # pp "Connection::connect() current_user:" << self.current_user.inspect
    end

    private
      def find_verified_user
        # 本来はcookieなどを使い接続してきたクラウアントのユーザーを検索するが
        # 今回は動作確認したいだけなのでランダムでユーザーを1人返す
        # User.all.sample
      end
  end
end
