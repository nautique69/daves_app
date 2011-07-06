class SitesController < ApplicationController
 before_filter :authenticate

  def new
  
  end
  
  def show
		@site = Site.find(params[:id])
		@title = @site.name
  end
  
  def index
		@title = "Listing all sites"		
		@sites = Site.where(:user_id => current_user).paginate(:page => params[:page])
  end

end
