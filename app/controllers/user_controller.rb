class UserController < ApplicationController
  layout "application"


  def show
    @user = User.where(id: params[:id]).take
    @posts = Post.where(author: @user.id).order(created_at: :desc)
  end

  def friend_up
    @user = User.find(params[:id])
    @user.friends.create(follower: current_user.id)
  end
end
