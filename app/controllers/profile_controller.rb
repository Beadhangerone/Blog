class ProfileController < ApplicationController

  def show
    @header = "your profile"
    @user = current_user
    @avatar = @user.avatar

    $followers = []
    @user.followers.each do |follower|
      $followers << user_by_id(follower.follower_id)
    end

    $followings = []
     Follower.where(follower_id: current_user.id).find_each do |following|
       $followings << user_by_id(following.user_id)
     end

    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def followers
    @header = "your followers"
  end

  def followings
    @header = "your followings"
  end

end
