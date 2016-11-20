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

  def friend_up
    @user = User.find(params[:id])
    if current_user.friends_id !=nil
      current_user.friends_id +=", #{@user.id}"
      current_user.save
    else
      current_user.friends_id = current_user.id
      current_user.save
    end
  end

end
