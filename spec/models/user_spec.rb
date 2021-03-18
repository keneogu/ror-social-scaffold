require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:friendships) }
    it { should have_many(:inverse_friendships).class_name('Friendship') }
    it { should have_many(:confirmed_friendships).class_name('Friendship') }
    it { should have_many(:friends).through(:confirmed_friendships) }
    it { should have_many(:pending_friendships).class_name('Friendship') }
    it { should have_many(:pending_friends).through(:pending_friendships).source(:friend) }
    it { should have_many(:inverted_friendships).class_name('Friendship') }
    it { should have_many(:friend_requests).through(:inverted_friendships).source(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
  end
end
