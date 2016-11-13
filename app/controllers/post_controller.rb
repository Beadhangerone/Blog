class PostController < ApplicationController
  layout "application"
  before_action :authenticate_user!
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    $post=Post.new
  end

  def create
    $post.title = params[:post][:title]
    $post.text = params[:post][:text]
    $post.author = current_user.username
    $post.save

    redirect_to post_index_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_index_path
  end

  def edit
    $post = Post.find(params[:id])
  end

  def update
  end
end
