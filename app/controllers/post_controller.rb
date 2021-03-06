class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :post_by_params_id, only: [:like, :unlike, :edit, :destroy, :show]
  before_action :author?, only: [:edit, :destroy, :update]
  before_action :post_bars, only: [:index, :followings, :liked]

  def index
    @header = "all posts"
    @posts = Post.search(params[:search]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end

  def followings
    @header = "followings' posts"
    followings = Follower.where(follower_id: current_user.id).map(&:user_id)
    @posts = Post.where(author_id: followings).order(created_at: :desc).paginate(page: params[:page], :per_page => 3)
  end

  def liked
    @header = "liked posts"   
    liked = Like.where(author_id: current_user.id).order(created_at: :desc).map(&:post_id)
    @posts = Post.where(id: liked).paginate(page: params[:page], :per_page => 3)
  end

  def new
    @header = "write a new post"
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      flash[:notice] = "Posted successfully."
      redirect_to post_path(@post)
    else
      @header = "write a new post"
      render action: "new"
    end
  end

  def show
    @comment = Comment.new
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
    redirect_to post_index_path
  end

  def edit
    @header = "edit post"
  end

  def update
    $post.title = params[:post][:title]
    $post.text = params[:post][:text]
    $post.cover = params[:post][:cover]
    if $post.save
      flash[:notice] = "Edited successfully."
      redirect_to post_path($post)
    else
      @header = "edit post"
      render action: "edit"
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

  def post_params
    params.require(:post).permit(:title, :text, :cover)
  end

  def author?
    if $post.author_id != current_user.id
      redirect_to post_path($post)
    end
  end

  def post_by_params_id
    $post = Post.find(params[:id])
  end

  def post_bars
    @access = user_signed_in?
    @bars = {
      "#{followings_posts_path}" => "Followings' posts",
      "#{liked_posts_path}" => "Liked posts",
      "#{post_index_path}" => "All posts"
    }
  end

end
