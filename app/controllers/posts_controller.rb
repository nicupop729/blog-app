class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)

    @user_posts = Post.where(user_id: @user_id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
