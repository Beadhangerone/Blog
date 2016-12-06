class UserController < ApplicationController
  before_action :user_by_params_id
  before_action :get_follow_info, except: [:friend_up, :unfollow]

  def show
    @header = "#{@user.username.downcase}'s page"
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)

  end

  def followers
    @header = "#{@user.username.downcase}'s followers"
  end

  def followings
    @header = "#{@user.username.downcase}'s followings"
  end

  def follow
    @user.followers.create(follower_id: current_user.id)
    redirect_to (user_path(@user))
  end

  def unfollow
    @user.followers.where(follower_id: current_user.id).take.delete
    redirect_to (user_path(@user))
  end

  private

  def user_by_params_id
    @user = user_by_id(params[:id])
  end

  def get_follow_info

    $followers = []
    Follower.where(user_id: @user.id).find_each do |follower|
      $followers << user_by_id(follower.follower_id)
    end

    $followings = []
     Follower.where(follower_id: @user.id).find_each do |following|
       $followings << user_by_id(following.user_id)
     end
  end
end
