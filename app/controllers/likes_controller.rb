class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @current_user = current_user
    @current_post = Post.find(params[:post_id])
    is_liked = Like.where(user: @current_user, post: @current_post).exists?
    redirect_back(fallback_location: root_path)

    if is_liked
      flash.now[:error] = 'Error: You already liked this post'
    else
      @like = Like.new(user: @current_user, post: @current_post)
      @like.save
      flash[:success] = 'You liked this post'
    end
  end
end
