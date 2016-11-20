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
    $post.author = current_user.id
    $post.save
    current_user.amount_of_posts += 1
    current_user.save

    redirect_to post_path($post)
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author)
    @likers = []
    @post.likes.each do |like|
      @likers << like.author
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    current_user.amount_of_posts -= 1
    current_user.save

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
    @post.likes.create(author: current_user.username)
    redirect_to post_path(@post)
  end

  def unlike
    @post = Post.find(params[:id])
    @post.likes.where(author: current_user).take.delete
    redirect_to post_path(@post)
  end

  private

  def author?
    post = Post.find(params[:id])
    if post.author != current_user.username
      redirect_to post_path(post)
    end
  end

end
