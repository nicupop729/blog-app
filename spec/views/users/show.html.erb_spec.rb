require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'user#show' do
  before :each do
    @current_user = User.create(name: 'Nicu', photo: 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80',
                                email: 'test@test.com', password: 'password', posts_counter: 0)
    @current_user.posts.create(title: 'test-post-1', text: 'post-content-1', comments_counter: 0, likes_counter: 0)
    @current_user.posts.create(title: 'test-post-2', text: 'post-content-2', comments_counter: 0, likes_counter: 0)
    @current_user.posts.create(title: 'test-post-3', text: 'post-content-3', comments_counter: 0, likes_counter: 0)
    @current_user.posts.create(title: 'test-post-4', text: 'post-content-4', comments_counter: 0, likes_counter: 0)
    @current_user.posts.create(title: 'test-post-5', text: 'post-content-5', comments_counter: 0, likes_counter: 0)
  end

  describe 'when vising main page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Nicu'
    end

    it 'it should list the name of the target user' do
      expect(page).to have_text(@current_user.name)
    end

    it 'it should list the profile picture of the target user' do
      expect(page).to have_css('.photo_users')
    end

    it 'it should list the number of the target user' do
      expect(page).to have_text("Number of post: #{@current_user.posts_counter}")
    end

    it 'it should present the bio of the current user' do
      expect(page).to have_text(@current_user.bio)
    end

    it "the page should have 'See all posts'" do
      expect(page).to have_text('See all posts')
    end

    it "the user's first 3 posts are available" do
      expect(page).to have_text('post-content-3')
    end

    it "the user's first 3 posts are available" do
      expect(page).to have_no_text('post-content-2')
    end

    it "the user's first 3 posts are available" do
      click_button 'See all posts'
      expect(page).to have_text('Create new post')
    end
  end
end