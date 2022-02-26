require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(name: 'Guess Who', photo: 'URL', bio: 'Web dev', posts_counter: 0) }
  let(:post) { Post.create!(user: user, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0) }

  it 'update likes counter for post' do
    post.likes.create(user: user)
    expect(post.likes_counter).to be(1)
  end
end
