require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'New registrations', type: :view do
  before :each do
    User.create(name: 'Test', email: 'test@test.com', password: 'test1234', posts_counter: 0)
  end

  describe  'new registration page' do
    it 'shows the email field' do
      visit new_user_session_path
      expect(page).to have_field('Email')
    end

    it 'shows the user password field' do
      visit new_user_session_path
      expect(page).to have_field('Password')
    end

    it 'shows the Log in' do
      visit new_user_session_path
      expect(page).to have_button('Log in')
    end

    it 'When incorrect username and the password are submitted, detailed error is presented.' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'incorect@example.com'
      fill_in 'Password', with: 'incorrectPass'
      click_button 'Log in'
      expect(page).to have_text('Forgot your password?')
    end

    it 'When correct username and the password are submitted, redirected to the root page.' do
      visit '/users/sign_in'
      fill_in 'Email', with: 'firstUser@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_text('BLOG RAILS')
    end
  end
end
