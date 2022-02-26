class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)

    @user_posts = Post.where(user_id: @user_id).includes(:comments)
  end

  def show
    @post = Post.find(params[:id])
    @user_id = params[:user_id]
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @post = Post.new(user: @current_user, title: params[:post][:title], text: params[:post][:text],
                     comments_counter: 0, likes_counter: 0)

    if @post.valid?
      @post.save
      redirect_to user_posts_url({ id: @post.id }), notice: 'Post successfully created'
    else
      flash[:notice] = @post.errors.full_messages.join("\n")
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
