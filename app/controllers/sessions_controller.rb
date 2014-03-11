class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[signin][:email]).first
    if user && user.authenticate(params[:signin][:password])
      session[:user_id] = user.id
      flash[:notice] = "Signed in succesfully!"
      redirect_to root_url
    else
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"

    redirect_to root_url
  end
end
