class AccountController < ApplicationController
  layout "application"

  def show
    @account = User.where(username: params[:id]).take 
  end
end
