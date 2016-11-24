class UserController < ApplicationController
  layout "application"


  def show
    @user = User.where(id: params[:id]).take
    @avatar = @user.avatar
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
    @followers = []
    @user.followers.each do |follower|
      @followers << User.find(follower.follower_id)
    end
  end

  def friend_up
    @user = User.find(params[:id])
    @user.followers.create(follower_id: current_user.id)
    redirect_to (user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    @user.followers.where(follower_id: current_user.id).take.delete
    redirect_to (user_path(@user))
  end
end
