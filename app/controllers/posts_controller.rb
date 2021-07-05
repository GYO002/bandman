class PostsController < ApplicationController
  
  def index
    @posts = Post.includes(:user)
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :future, :image).merge(user_id: current_user.id)
  end


end
