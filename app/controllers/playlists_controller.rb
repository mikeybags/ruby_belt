class PlaylistsController < ApplicationController
  def create
    @song = Song.find(params[:song_id])
    @user = User.find(session[:user_id])
    @playlist_song = Playlist.new(song: @song, user: @user)
    if @playlist_song.save
      @song.playlist_count += 1
      @song.save
      flash[:notice] = ["#{@song.title} has been added to your playlist!"]
    end
    redirect_to :back
  end
end
