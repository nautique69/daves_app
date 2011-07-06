class SitesconfigsController < ApplicationController
 before_filter :authenticate

  def new
	@title = "Create new site"  
  end
  
  def show

  end
  
  def index

  end

end