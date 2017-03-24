class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = ["You have been registered! Please log in."]
    else
      flash[:notice] = @user.errors.full_messages
    end
    redirect_to :back
  end

  def show
    if !current_user
      redirect_to root_path
    end
    @user = User.find(params[:id])
    @playlist = Playlist.where("user_id = ?", params[:id])
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
