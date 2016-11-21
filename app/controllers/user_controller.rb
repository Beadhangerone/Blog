class UserController < ApplicationController
  layout "application"


  def show
    @user = User.where(id: params[:id]).take
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
    @followers = []
    @user.friends.each do |friend|
      @followers << User.find(friend.follower)
    end
  end

  def friend_up
    @user = User.find(params[:id])
    @user.friends.create(follower: current_user.id)
    redirect_to (user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    @user.friends.where(follower: current_user.id).take.delete
    redirect_to (user_path(@user))
  end
end
