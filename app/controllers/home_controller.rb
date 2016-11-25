class HomeController < ApplicationController 
    layout "application"
  def index
  end

  def my_profile
    @user = current_user
    @avatar = @user.avatar

    @followers = []
    @user.followers.each do |follower|
      @followers << user_by_id(follower.follower_id)
    end

    @followings = []
    @a = current_user.id
     Follower.where(user_id: current_user.id).find_each do |following|
       @followings << user_by_id(following.follower_id)
     end

    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def settings
    @avatar = Avatar.new
  end

end
