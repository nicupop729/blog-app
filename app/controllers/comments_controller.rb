class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @current_post = Post.find(params[:post_id])

    @comment = Comment.new(post: @current_post, user: @current_user, text: params[:comment][:text])

    if @comment.save
      redirect_to user_post_url({ id: @current_post.id }), flash: { success: 'Your comment was saved' }
    else
      render :new, :flash.now => { error: 'Something went wrong with your comment' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
