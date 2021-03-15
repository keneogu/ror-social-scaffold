class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def update
    @user = User.find(params[:id])
    if current_user.confirm_friend(@user)
      redirect_to users_path, notice: 'Friend request Accepted'
    else
      redirect_to users_path, alert: 'Error!!! '
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.reject_friend(@user)
      redirect_to users_path, notice: 'Friend request rejected'
    else
      redirect_to users_path, alert: 'Error!!! '
    end
  end
  end
end
