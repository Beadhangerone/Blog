class HomeController < ApplicationController 
  
  def index
  end

  def settings
    @avatar = Avatar.new
  end

end
