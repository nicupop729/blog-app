class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  def last_five_comm
    comments.order(created_at: :desc).last(5)
  end

  private

  def update_posts_counter
    user.update(posts_counter: user.posts.length)
  end
end
