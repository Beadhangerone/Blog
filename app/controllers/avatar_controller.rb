class AvatarController < ApplicationController

  def new
    @header = "upload your photo"
    @avatar = Avatar.new
  end

  def create
    if current_user.avatar
      current_user.avatar.delete
    end
    @avatar=Avatar.new
      
    if @avatar.save
      @avatar.image = params[:avatar][:image]
      @avatar.user_id = current_user.id
      flash[notice] = "Photo saved!"
      redirect_to profile_path
    else
      @header = "upload your photo"
      render 'new'
    end
  end


end
