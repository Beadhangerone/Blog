class HomeController < ApplicationController 
    layout "application"
  def index
  end

  def my_profile
    @user = current_user
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
    @followers = []
    @user.followers.each do |follower|
      @followers << User.find(follower.follower_id)
    end
  end
end
