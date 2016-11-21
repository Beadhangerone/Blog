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
    $post.author_id = current_user.id
    if $post.save 

      current_user.amount_of_posts += 1
      current_user.save

      flash[:notice] = "Posted successfully."
      redirect_to post_path($post)
    end
  end

  def show
    @post = Post.find(params[:id])
    @author = User.find(@post.author_id)
    @likers = []
    @post.likes.each do |like|
      @likers << User.find(like.author_id).username
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
    if $post.save
      flash[:notice] = "Edited successfully."
      redirect_to post_path($post)
    end
  end

  def like
    post = Post.find(params[:id])
    post.likes.create(author_id: current_user.id)
    redirect_to post_path(post)
  end

  def unlike
    post = Post.find(params[:id])
    post.likes.where(author_id: current_user.id).take.delete
    redirect_to post_path(post)
  end

  private

  def author?
    post = Post.find(params[:id])
    if post.author_id != current_user.id
      redirect_to post_path(post)
    end
  end

end
