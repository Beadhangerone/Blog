class ProfileController < ApplicationController

  before_action :get_folow_info

  def show
    @header = "your profile"
    @avatar = @user.avatar
    @posts = Post.where(author_id: @user.id).order(created_at: :desc)
  end

  def followers
    @header = "your followers"
  end

  def followings
    @header = "your followings"
  end

  private

  def get_folow_info
    @user = current_user

    $followers = []
    Follower.where(user_id: @user.id).find_each do |follower|
      $followers << user_by_id(follower.follower_id)
    end

    $followings = []
     Follower.where(follower_id: @user.id).find_each do |following|
       $followings << user_by_id(following.user_id)
     end
  end
end
