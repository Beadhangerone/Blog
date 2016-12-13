class AvatarController < ApplicationController

  def new
    @header = "upload your photo"
    @avatar = Avatar.new
  end

  def create
    @avatar=Avatar.new
    if params[:avatar]
      if current_user.avatar
        current_user.avatar.delete
      end
      @avatar.image = params[:avatar][:image]
      @avatar.user_id = current_user.id
    end
    if @avatar.save

      flash[notice] = "Photo saved!"
      redirect_to profile_path
    else
      @header = "upload your photo"
      render 'new'
    end
  end




  private

  def avatar_params
    params.require(:avatar).permit(:image)
  end


end
