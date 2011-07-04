class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
	  # needs to be looked at as there is no code/page for creating users ??????
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      #redirect_to @user
	  redirect_to mainmenu_path
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  

  
end
