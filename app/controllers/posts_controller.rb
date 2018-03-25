class PostsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', alert: exception.message
  end

  def new
    @post = Post.new
  end

  def show
    # @post = Post.find(params[:id])
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post
  end

  def create
    user_id = current_user.id

    Post.create(
        content: params[:post][:content],
        user_id: user_id
    )

    redirect_to user_path(id: user_id)
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end