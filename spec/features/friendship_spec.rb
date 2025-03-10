require 'rails_helper'

RSpec.feature 'Friendship Invitations', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'first', email: 'first@first.com', password: 'password')
    @second_user = User.create(name: 'second', email: 'second@second.com', password: 'password')
    visit user_session_path
    fill_in 'Email', with: 'first@first.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'should visit timeline page' do
    visit posts_path
    fill_in :Content, with: 'This is my first post'
    click_on 'Save'
    expect(page).to have_text('Recent posts')
  end

  scenario 'should check users have an Invite to Friendship button' do
    visit users_path
    expect(page).to have_text('Invite to Friendship')
    click_on 'Invite to Friendship'
  end

  scenario 'should accept or reject friend request' do
    visit users_path
    click_on 'Invite to Friendship'
    click_on 'Sign out'
    fill_in 'Email', with: 'second@second.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
    visit users_path
    expect(page).to have_link('Accept')
  end
end
