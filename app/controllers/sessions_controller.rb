class SessionsController < ApplicationController

  def login_form
  end

  def login
    user = User.find_by(name_id: params[:session][:name_id].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        session[:user_id] = user.id
        user.update_attribute(:is_login, 1)
        redirect_to raids_path
    elsif !user
        flash.now[:alert] = 'ユーザーおらんよ'
        render 'login_form'
    else
        flash.now[:alert] = 'パスワードちがうよ'
        render 'login_form'
    end
  end

  def logout
      user = User.find(session[:user_id])
      user.update_attribute(:is_login, 0)
      session.delete(:user_id)
      redirect_to login_path
  end
end
