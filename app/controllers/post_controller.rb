class PostController < ApplicationController
  layout "application"
  before_action :authenticate_user!
  before_action :author?, only: [:edit, :destroy]

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

    redirect_to post_path($post)
  end

  def show
    @post = Post.find(params[:id])
    @likes = []
    @post.likes.each do |like|
      @likes << like.author
    end
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
    $post.title = params[:post][:title]
    $post.text = params[:post][:text]
    $post.save

    redirect_to post_path($post)
  end

  def like
    @post = Post.find(params[:id])
    like = @post.likes.create(author: current_user.username)
    redirect_to post_path(@post)
  end

  def unlike
    @post = Post.find(params[:id])
    @post.likes.where(author: current_user.username).take.delete
    redirect_to post_path(@post)
  end

  private

  def author?
    post = Post.find(params[:id])
    if not post.author == current_user
      redirect_to post_path(post)
    end
  end

end
