require 'rails_helper'
require 'capybara/rspec'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Post index page for User', type: :feature do
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
      click_button 'See all posts'
    end

    it "User's profile picture is visible" do
      expect(page).to have_css('.photo_users')
    end

    it "The user's username is present" do
      expect(page).to have_content @current_user.name
    end

    it 'The posts count of the user is present' do
      expect(page).to have_content "Number of post: #{@current_user.posts_counter}"
    end

    it "Post's title is present" do
      expect(page).to have_content @current_user.posts[0].title
    end

    it "Some of the post's body is present" do
      expect(page).to have_content @current_user.posts[0].text
    end

    it 'The first comments on a post is presetnt' do
      expect(page).to have_content @current_user.posts[0].last_five_comm[0]
    end

    it 'The number of comments on a post is present' do
      expect(page).to have_content "Comments: #{@current_user.posts[0].comments_counter}"
    end

    it 'The number of likes on a post is present' do
      expect(page).to have_content "Likes: #{@current_user.posts[0].likes_counter}"
    end
  end
end
# rubocop:enable Metrics/BlockLength
