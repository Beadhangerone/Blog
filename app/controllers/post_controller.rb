class PostController < ApplicationController
  before_action :authenticate_user!
  before_action :post_by_params_id, only: [:like, :unlike, :edit, :destroy, :show]
  before_action :author?, only: [:edit, :destroy]
  before_action :post_bars, only: [:index, :followings, :liked]

  def index
    @header = "all posts"
    @posts = Post.paginate(:page => params[:page], :per_page => 2)
  end

  def followings
    @header = "followings' posts"
    @posts = []
    Follower.where(follower_id: current_user.id).find_each do |follower|
      Post.where(author_id: follower.user_id).find_each do |follower_post|
        @posts << follower_post
      end
    end
  end

  def liked
    @header = "liked posts"
    @posts = []
    Like.where(author_id: current_user.id).find_each do |like|
      @posts << Post.find(like.post_id) 
    end
  end

  def new
    @header = "write a new post"
    @post=Post.new
  end

  def create
    @post = Post.create(
    :title => params[:post][:title],
    :text => params[:post][:text],
    :author_id => current_user.id)

    if @post.valid? 

      current_user.amount_of_posts += 1
      current_user.save

      flash[:notice] = "Posted successfully."
      redirect_to post_path(@post)
    else
      @header = "write a new post"
      render action: "new"
    end
  end

  def show
    @header = $post.title.downcase
    @author = user_by_id($post.author_id)
    @comments = $post.comments.reverse
    @likers = []
    $post.likes.each do |like|
      @likers << user_by_id(like.author_id).username
    end
  end

  def destroy
    $post.destroy
    current_user.amount_of_posts -= 1
    current_user.save

    redirect_to post_index_path
  end

  def edit
    @header = "edit post"
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
    $post.likes.create(author_id: current_user.id)
    redirect_to post_path($post)
  end

  def unlike
    $post.likes.where(author_id: current_user.id).take.delete
    redirect_to post_path($post)
  end

  private

  def author?
    if $post.author_id != current_user.id
      redirect_to post_path($post)
    end
  end

  def post_by_params_id
    $post = Post.find(params[:id])
  end

  def post_bars
    @bars = {
      "#{followings_posts_path}" => "Followings' posts",
      "#{liked_posts_path}" => "Liked posts",
      "#{post_index_path}" => "All posts"
    }
  end

end
