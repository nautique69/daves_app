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
		find_create
	# siteconfigs = Siteconfig.find_or_create_by_site_id(:site_id => params[:site_id], :db => params[:siteconfig][:db], :status => params[:siteconfig][:status])
	# if siteconfigs.save
	    # flash[:success] = "Config updated"
        # redirect_to site_path(siteconfigs.site_id)
    # else
		# flash[:error] = siteconfigs.errors.each_full {|msg| p msg} #"Unable to update record.<br/>Please try again."
		# render 'new'
    # end

  end

  def edit
  
    @title = "Edit site config "
    sitefig = Siteconfig.find_by_site_id(params[:id])   
    if sitefig.nil? 
      render 'new'
    else
	  site = Site.find_by_id(params[:id])
	  if !site.nil?
		@title = site.name + " - Edit site config "
	  end
	  
      @siteconfigs = sitefig 
	  
    end  
	
  end  
  
  def update
	find_create
  
    # @siteconfig = Siteconfig.find_by_site_id(params[:id])	
    # if @siteconfig.update_attributes(params[:siteconfig])
      # flash[:success] = "Site config updated"
      # redirect_to site_path(@siteconfig.site_id)
     # else
      # render 'edit'
    # end

  end 
  
  private
  
	def find_create
		done = false
		msg1 = ""
		siteconfigs = Siteconfig.find_or_create_by_site_id(:site_id => params[:site_id], :db => params[:siteconfig][:db], :status => params[:siteconfig][:status])
		if siteconfigs.nil? # record found so need to update
			done = true
			msg1 = "Config created"
		else
			if siteconfigs.update_attributes(params[:siteconfig])
				done = true
				msg1 = "Config updated"
			end		
		end
				
		if done
			flash[:success] = msg1					
		else
			flash[:error] = siteconfigs.errors.each_full {|msg| p msg}
		end
		redirect_to site_path(siteconfigs.site_id)
	
	end

end