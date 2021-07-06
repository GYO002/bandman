class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :future, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @post.user
  end
end
