class ApplicationController < ActionController::Base
    include SessionsHelper

    before_action :set_current_user
    protect_from_forgery with: :null_session

    def authenticate_user
      if @current_user == nil
        flash[:alert] = 'ログインしてくれ'
        redirect_to("/login")
      end
    end

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
end
