class API::CommentsController < ActionController
  load_and_authorize_resource

  def index
    @comments = Comment.where({ post_id: params[:post_id] })
    render json: { success: true, data: { comments: @comments } }
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(text: params[:text], user: current_user, post: @post)

    if @comment.save
      render json: { success: true, data: { comment: @comment } }, status: :created
    else
      render json: { success: false, errors: @comment.errors }, status: :bad_request
    end
  end

  private

  def params
    params.require(:comment).permit(:text)
  end
end
