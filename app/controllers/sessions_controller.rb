class SessionsController < ApplicationController
  def new
	if signed_in?
		redirect_to sites_path
	else
		@title = "Sign in"
	end
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
     #redirect_to user
	  #redirect_to mainmenu_path
	 redirect_to sites_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
