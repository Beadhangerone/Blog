class AvatarController < ApplicationController
  def create
    @avatar=Avatar.new(avatar_params)
    @avatar.user_id = current_user.id
    if @avatar.save
      flash[notice] = "Photo saved!"
      redirect_to settings_path
    else
      render 'new'
    end
  end

  private

  def avatar_params
    params.require(:avatar).permit(:avatar)
  end

end
