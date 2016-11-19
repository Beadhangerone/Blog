class HomeController < ApplicationController 
    layout "application"
  def index
  end

  def my_profile
    @user = current_user
    @posts = Post.where(author: @user.username)
  end
end
