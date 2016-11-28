class UserController < ApplicationController

  def show
    @user = user_by_id(params[:id])
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
    @header = "user's followers"
  end

  def followings
    @header = "user's followings"
  end

  def friend_up
    @user = user_by_id(params[:id])
    @user.followers.create(follower_id: current_user.id)
    redirect_to (user_path(@user))
  end

  def unfollow
    @user = user_by_id(params[:id])
    @user.followers.where(follower_id: current_user.id).take.delete
    redirect_to (user_path(@user))
  end
end
