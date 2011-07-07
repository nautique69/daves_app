class SiteconfigsController < ApplicationController
 before_filter :authenticate

  def new
	# @title = "Site config for #{@current_site}" 
  end
  
  def show
	#@site = Siteconfig.find_by_id(params[:id])
  end
  
  def index

  end

  def create
    #@siteconfigs = Siteconfig.new(params[:siteconfig])
	siteconfigs = Siteconfig.find_or_create_by_site_id("qwqw", {:site_id => "3"})
    if siteconfigs.nil?
	  flash[:success] = "Config updated"
      redirect_to sites_path
    else
    	flash[:error] = siteconfigs.errors.each_full {|msg| p msg} #"Unable to update record.<br/>Please try again."
        render 'new'
    end
  end

  def edit
    @title = "Edit site config "
    #Review.find_or_create_by_url(sitename, {:staff_id => staff.id})
   
    sitefig = Siteconfig.find_by_site_id(params[:id])
   
    if sitefig.nil? 
       render 'new'
    else
      @siteconfig = sitefig 
    end    
  end  
  
  def update
    @siteconfig = Siteconfig.find(params[:id])
    if @siteconfig.update_attributes(params[:siteconfig])
      flash[:success] = "Site config updated"
      redirect_to sites_path
     else
      render 'edit'
    end

    # @user = User.find(params[:id])
    # if @user.update_attributes(params[:user])
    #   flash[:success] = "Profile updated."
    #   redirect_to @user
    # else
    #   @title = "Edit user"
    #   render 'edit'
    # end
  end 

end