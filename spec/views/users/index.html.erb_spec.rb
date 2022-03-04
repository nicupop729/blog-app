require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'user#index' do
  before :each do
    User.create(name: 'Nicu',
                photo: 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
                email: 'test@test.com',
                password: '123456', posts_counter: 0)
    User.create(name: 'Tom',
                photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
                email: 'test1@test.com',
                password: '654321',
                posts_counter: 0)
    User.create(name: 'Lilly',
                photo: 'https://images.unsplash.com/photo-1521146764736-56c929d59c83?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                email: 'test2@test.com',
                password: '7654321',
                posts_counter: 0)
  end

  describe 'when vising main page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'it should list the names of all users: Nicu' do
      expect(page).to have_text('Nicu')
    end

    it 'it should list the names of all users: Tom' do
      expect(page).to have_text('Tom')
    end

    it 'it should list the names of all users: Lilly' do
      expect(page).to have_text('Lilly')
    end

    it 'it should list the profile picture of all users' do
      expect(page).to have_css('.photo_users')
    end

    it 'it should list the number of posts of  of all users' do
      expect(page).to have_text('Number of post')
    end

    it 'When view user button is clicked, User is  redirected to that users show page.' do
      click_link 'Nicu'
      expect(page).to have_text('Bio')
    end
  end
end
