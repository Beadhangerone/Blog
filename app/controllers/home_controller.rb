class HomeController < ApplicationController 
    layout "application"
  def index
  end

  def my_profile
    @user = current_user
    @avatar = @user.avatar
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
    @followers = []
    @user.followers.each do |follower|
      @followers << User.find(follower.follower_id)
    end
  end

  def settings
    @avatar = Avatar.new
  end

end
