class API::PostsController < ActionController
  load_and_authorize_resource

  def index
    @posts = Post.all
    render json: { success: true, data: { posts: @posts } }
  end
end
