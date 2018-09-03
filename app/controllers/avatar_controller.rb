class AvatarController < ApplicationController

  def edit
    $user = current_user
  end

  def save
      if params[:user][:avatar]
        $user.avatar.remove!
        $user.avatar = params[:user][:avatar]
        if $user.save then redirect_to profile_path else render action: 'edit' end
      end
  end


end
