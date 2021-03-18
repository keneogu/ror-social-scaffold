class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friend_id: params[:user_id], confirmed: false)

    if @friendship.save
      redirect_to users_path, notice: 'Invitation sent!'
    else
      redirect_to users_path, alert: 'Something went wrong, please try again!'
    end
  end

  def update
    friend = User.find(params[:user_id])
    friendship = friend.friendships.find_by(friend_id: current_user.id)
    if current_user.friend_requests.include?(friend)
      friendship.confirm_friend
      redirect_to users_path, notice: 'Friend request Accepted'
    else
      flash[:notice] = 'Friendship was not modified.'
      render :update
    end
  end

  def destroy
    friend = User.find(params[:user_id])
    friendship = friend.friendships.find_by(friend_id: current_user.id)

    flash[:notice] = if friendship.destroy
                       'Friendship was rejected.'
                     else
                       'Some error happened.'
                     end
    redirect_to users_path
  end
end
