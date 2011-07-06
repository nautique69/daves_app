class SitesController < ApplicationController
 before_filter :authenticate

  def new
    @title = "Create new site"
  end

  def create
    @site = current_user.sites.build(params[:site])
   # @site = Site.new(params[:site])
    if @site.save
      flash[:success] = "New site created "
      redirect_to sites_path
    else
      flash[:error] = "Unable to update record.Please try again."
      render 'new'
    end
  end
  
  def show
		@site = Site.find(params[:id])
		@title = @site.name
  end
  
  def index
		@title = "Listing all sites"		
		@sites = Site.where(:user_id => current_user).paginate(:page => params[:page])
  end

  # def edit
  #   @title = "Edit user"
  # end  
  
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(params[:user])
  #     flash[:success] = "Profile updated."
  #     redirect_to @user
  #   else
  #     @title = "Edit user"
  #     render 'edit'
  #   end
  # end 

end
