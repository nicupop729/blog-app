require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
             posts_counter: 0)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postCounter should be integer higher or equal to 0' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'recentPosts method should return the recent three posts' do
    subject.posts.create!(title: 'test-post-1', text: 'post-content-1', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'test-post-2', text: 'post-content-2', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'test-post-3', text: 'post-content-3', comments_counter: 0, likes_counter: 0)
    subject.posts.create!(title: 'test-post-4', text: 'post-content-4', comments_counter: 0, likes_counter: 0)
    expect(subject.most_recent_posts.length).to be(3)
  end
end
