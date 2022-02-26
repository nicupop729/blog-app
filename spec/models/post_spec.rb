require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: 'Guess Who', photo: 'URL', bio: 'Web dev', posts_counter: 0) }
  subject do
    Post.create!(user: user, title: 'Testing', text: 'Content', comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'likesCounter shoul be integer higher or equal to 0' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likesCounter shoul be integer higher or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'comments_counter shoul be integer higher or equal to 0' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter shoul be integer higher or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'recent comments should return the last 5 comments' do
    subject.comments.create!(post: subject, user: user, text: 'test commetn-1')
    subject.comments.create!(post: subject, user: user, text: 'test commetn-2')
    subject.comments.create!(post: subject, user: user, text: 'test commetn-3')
    subject.comments.create!(post: subject, user: user, text: 'test commetn-4')
    subject.comments.create!(post: subject, user: user, text: 'test commetn-5')
    subject.comments.create!(post: subject, user: user, text: 'test commetn-6')
    subject.comments.create!(post: subject, user: user, text: 'test commetn-7')
    expect(subject.last_five_comm.length).to be(5)
  end
end
