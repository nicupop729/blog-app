require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: 'Guess Who', photo: 'URL', bio: 'Web dev', posts_counter: 0) }
  let(:post) { Post.create!(user: user, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0) }

  it 'update comment counter for post' do
    post.comments.create(user: user)
    expect(post.comments_counter).to be(0)
  end
end
