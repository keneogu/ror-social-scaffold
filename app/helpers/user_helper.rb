module UserHelper
  def profile_heading(user)
    current_user == user ? "My Profile: #{user.name}" : "Name: #{user.name}"
  end

  def show_invite_to_friendship(user)
    invite_to_friendship(user) unless current_user == user
  end

  def mutual_friends_list(user)
    @mutual_friends if user != current_user && @mutual_friends.size.positive?
  end
end
