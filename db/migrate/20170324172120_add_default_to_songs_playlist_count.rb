class AddDefaultToSongsPlaylistCount < ActiveRecord::Migration
  def up
	   add_column :songs, :playlist_count, :integer, :default => 0
  end
end
