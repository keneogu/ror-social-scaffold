class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    my_friends = current_user.friends
    user_friends = @user.friends
    @mutual_friends = my_friends & user_friends
  end
end
