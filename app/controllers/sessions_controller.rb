class SessionsController < ApplicationController

  def login_form
  end

  def login
    user = User.find_by(name_id: params[:session][:name_id].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to users_path
    elsif !user
        flash.now[:alert] = 'ユーザーおらんよ'
        render 'login_form'
    else
        flash.now[:alert] = 'パスワードちがうよ'
        render 'login_form'
    end
  end

  def destroy
  end
end
