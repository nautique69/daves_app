class SitesController < ApplicationController
  def new
  
  end
  
  def show
	if signed_in?
		@site = Site.find(params[:id])
		@title = @site.name
	else
		redirect_to root_path
	end

  end
  
  def index
	if signed_in?
		@title = "Listing all sites"		
		@sites = Site.where(:user_id => current_user.id).paginate(:page => params[:page])
	else
		redirect_to root_path
	end
  end

end
