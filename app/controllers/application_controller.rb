class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    before_action :set_current_user
    
    private

      # ログイン済ユーザーかどうか確認
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "ログインが必要です。"
          redirect_to login_url
        end
      end
end
