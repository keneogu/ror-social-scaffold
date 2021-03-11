class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :inverse_friendships, :class_name => 'Friendship', :foreign_key => 'friend_id'

  def friends
    friends_array = friendships.map { |f| f.friend if f.confirmed }
    friends_array + inverse_friendships.map { |f| f.user if f.confirmed }
    friends_array.compact
  end

  # Users who have yet to confirm friend requests
  def pending_friends
    friendships.map { |f| f.friend if !f.confirmed }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |f| f.user if !f.confirmed }.compact
  end

  # To confirm a friend request
  def confirm_friend(user)
    friendship = inverse_friendships.find { |f| f.user == user }
    friendship.confirmed = true
    friendship.save
  end

  # Check to see if a given user is a friend
  def friend?(user)
    friends.include?(user)
  end


end
