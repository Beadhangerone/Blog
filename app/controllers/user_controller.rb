class UserController < ApplicationController
  layout "application"

  def show
    @user = User.find(params[:id])
  end

end
