class User < ActiveRecord::Base
  has_secure_password
  has_many :playlists
  has_many :songs, through: :playlists

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
