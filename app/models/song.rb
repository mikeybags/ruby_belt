class Song < ActiveRecord::Base
  has_many :playlists
  has_many :users, through: :playlists
  
  validates :artist, :title, presence: true, length: { minimum: 2 }
end
