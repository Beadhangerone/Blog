class UserController < ApplicationController

  def show
    @user = user_by_id(params[:id])
    @avatar = @user.avatar
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
    @followers = []
    @user.followers.each do |follower|
      @followers << user_by_id(follower.follower_id)
    end
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
