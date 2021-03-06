class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to items_path, notice: 'Login successful'
    else
      flash.now[:alert] = "Login failed"
      render :new
    end 
  end

  def destroy
  	logout
  	redirect_to root_path, notice: 'Logged out!'
  end
end
