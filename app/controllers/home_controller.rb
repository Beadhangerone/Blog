class HomeController < ApplicationController 
    layout "application"
  def index
  end

  def my_profile
    @user = current_user
    @posts = Post.where(author: @user.id).order(created_at: :desc)
    @friends = []
    if @user.friends_id != nil
      @user.friends_id.split(", ").each do |friend_id|
        @friends << User.find(friend_id) 
      end
    end
  end
end
