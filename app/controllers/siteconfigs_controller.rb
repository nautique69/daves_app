class SiteconfigsController < ApplicationController
 before_filter :authenticate

  def create
  	@title = "Create site config "
  	create_title(" - Create site config ")
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
      create_title(" - Edit site config ")	  
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
  
  	def create_title(string)
	  site = Site.find_by_id(params[:id])
	  if !site.nil?
		@title = site.name + string
	  end
  	end 
  
	def find_create
		done = false
		msg1 = ""
		siteconfigs = Siteconfig.find_or_create_by_site_id(:site_id => params[:site_id],
														   :db => params[:siteconfig][:db],
														   :status => params[:siteconfig][:status],
														   :dbtype => params[:siteconfig][:dbtype],
														   :username => params[:siteconfig][:username],
														   :password => params[:siteconfig][:password])
		if siteconfigs.nil? # record found so need to update
			done = true
			msg1 = "Config created"
		else
			if siteconfigs.update_attributes(params[:siteconfig]) #update record
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