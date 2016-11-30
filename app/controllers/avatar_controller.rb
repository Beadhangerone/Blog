class AvatarController < ApplicationController

  def new
    @header = "upload your photo"
    @avatar = Avatar.new
  end

  def create
    if current_user.avatar
      @avatar = current_user.avatar
    else
      @avatar=Avatar.new
    end
    @avatar.image = params[:avatar][:image]
    @avatar.user_id = current_user.id
    if @avatar.save
      flash[notice] = "Photo saved!"
      redirect_to profile_path
    else
      render 'new'
    end
  end


end
