require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Post index page for User', type: :feature do
  let(:user) do
    User.create!(name: 'Nicu', email: 'test@test.com', password: 'password',
                 photo: 'https://images.unsplash.com/photo
                 -1552374196-c4e7ffc6e126?ixlib=rb-1.2.1&i
                 xid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufD
                 B8fHx8&auto=format&fit=crop&w=2787&q=80',
                 bio: 'Lorry driver',
                 posts_counter: 0)
  end

  before :each do
    @post = Post.create!(user: user, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0)
    @post.comments.create!(user: user, text: 'comment-1')
    @post.comments.create!(user: user, text: 'comment-2')
  end

  describe 'when vising post show page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Nicu'
      click_button 'See all posts'
      click_link 'Testing'
    end

    it 'The post title is visible' do
      expect(page).to have_text @post.title
    end

    it 'The post author name is present' do
      expect(page).to have_content @post.user.name
    end

    it 'the number of comments is present' do
      expect(page).to have_content "Comments: #{@post.comments_counter}"
    end

    it 'The number of likes is present' do
      expect(page).to have_content "Likes: #{@post.likes_counter}"
    end

    it 'The post content is present.' do
      expect(page).to have_content @post.text
    end

    it 'Each commentor name is present.' do
      @post.comments.each do |comment|
        expect(page).to have_content comment.user.name
      end
    end

    it 'The content of the  each comment is present ' do
      @post.comments.each do |comment|
        expect(page).to have_content comment.text
      end
    end
  end
end
