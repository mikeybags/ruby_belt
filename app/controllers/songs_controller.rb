class SongsController < ApplicationController
  def index
    if !current_user
      redirect_to root_path
    else
      @user = User.find(current_user)
      @songs = Song.all.order('playlist_count DESC')
      @song = Song.new
    end
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = ["Song added!"]
    else
      flash[:notice] = @song.errors.full_messages
    end
    redirect_to :back
  end

  def show
    if !current_user
      redirect_to root_path
    end
    @song = Song.find(params[:id])
  end

  private
    def song_params
      params.require(:song).permit(:title, :artist)
    end
end
