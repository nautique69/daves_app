class PagesController < ApplicationController
  def home
  	if signed_in?
  		redirect_to sites_path
    else	
  		@title = "Login"  	
    end
  end

end
