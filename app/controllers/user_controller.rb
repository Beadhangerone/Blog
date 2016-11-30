class UserController < ApplicationController

  before_action :user_by_params_id, except: [:followers, :followings]

  def show
    @header = "#{@user.username}'s page"
    @avatar = @user.avatar
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)

    $followers = []
    Follower.where(user_id: @user.id).find_each do |follower|
      $followers << user_by_id(follower.follower_id)
    end

    $followings = []
     Follower.where(follower_id: @user.id).find_each do |following|
       $followings << user_by_id(following.user_id)
     end
  end

  def followers
    @header = "users followers"
  end

  def followings
    @header = "users followings"
  end

  def friend_up
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
end
