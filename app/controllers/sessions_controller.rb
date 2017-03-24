class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to songs_path
    else
      if !@user
        flash[:notice] = ["User not found. Please enter a valid email."]
      else
        flash[:notice] = ["Incorrect password. Please re-enter your password"]
      end
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
