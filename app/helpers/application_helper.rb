module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def invite_to_friendship(user)
    return if current_user.id == user.id || current_user.friends.include?(user)

    if current_user.pending_friends.include?(user)
      link_to('Friend Request sent', '#')
    elsif current_user.friend_requests.include?(user)
      link_to('Accept', accept_path(user_id: user.id), method: :put) + ' / ' +
        link_to('Reject', reject_path(user_id: user.id), method: :delete, data: { confirm: 'Are you sure?' })
    else
      link_to('Invite to Friendship', add_path(user_id: user.id), method: :post)
    end
  end

  def sign_in_and_sign_out
    if current_user
      link_to 'Sign out', destroy_user_session_path, method: :delete
    else
      link_to 'Sign in', user_session_path
    end
  end

  def user_name
    current_user&.name&.upcase
  end

  def notice_message
    notice if notice.present?
  end

  def alert_message
    alert if alert.present?
  end
end
