module UserHelper
  def profile_heading(user)
    current_user == user ? "My Profile: #{user.name}" : "Name: #{user.name}"
  end

  def show_invite_to_friendship(user)
    invite_to_friendship(user) unless current_user == user
  end

  def mutual_friends_heading(user)
    'Mutual Friends:' if user != current_user
  end

  def no_mutual_friends(user)
    "You and #{user.name} have no common friends." if user != current_user && @mutual_friends.size.zero?
  end

  def mutual_friends_list(user)
    user != current_user ? @mutual_friends : []
  end
end
