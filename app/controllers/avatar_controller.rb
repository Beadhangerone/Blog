class AvatarController < ApplicationController

  def edit
    $user = current_user
  end
    
  def save
    $user.avatar = params[:user][:avatar]
    if $user.save
      redirect_to profile_path
    end
  end


end
