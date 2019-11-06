class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:edit, :update, :index]}

  def index
      @users = User.all
  end

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      @user.is_login = 0
      if @user.save
          redirect_to login_path
      else
          render 'new'
      end
  end

  private
      def user_params
          params.require(:user).permit(:name_id, :password, :comment)
      end
end
