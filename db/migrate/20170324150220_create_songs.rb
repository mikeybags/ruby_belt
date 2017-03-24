class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.integer :playlist_count

      t.timestamps null: false
    end
  end
end
