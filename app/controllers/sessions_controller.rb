class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name_id: params[:session][:name_id].downcase)
    if user && user.password == params[:session][:password]
        log_in user
        redirect_to users_path
    else
        flash.now[:danger] = 'Invalid name/password combination'
        render 'new'
    end
  end

  def destroy
  end
end
