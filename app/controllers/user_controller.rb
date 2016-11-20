class UserController < ApplicationController
  layout "application"

  def show
    @user = User.where(username: params[:id]).take
    @posts = Post.where(author: @user.username).order(created_at: :desc)
    @friends = []
    if @user.friends_id != nil
      @user.friends_id.split(", ").each do |friend_id|
        @friends << User.find(friend_id) 
      end
    end
  end

  def make_friend
    @user = User.where(username: params[:id]).take
  end

end
