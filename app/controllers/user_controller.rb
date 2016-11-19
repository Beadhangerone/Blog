class UserController < ApplicationController
  layout "application"

  def show
    @user = User.where(username: params[:id]).take
    @posts = Post.where(author: @user.username)
  end

end
