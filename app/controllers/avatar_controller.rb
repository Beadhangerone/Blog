class AvatarController < ApplicationController

  def edit
    $user = current_user
  end
    
  def save
    $user.avatar = params[:user][:avatar] if params[:user]
    if $user.save
      redirect_to profile_path
    else
    	render action: 'edit'
    end
  end


end
