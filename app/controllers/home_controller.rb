class HomeController < ApplicationController 
  
  def index
  end

  def settings
    @header = "settings"
    @avatar = Avatar.new
  end

end
