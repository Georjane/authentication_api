class User < ApplicationRecord
  has_secure_password
  has_many :hotels
  has_many :favorites

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }

  def self.fav_hotels(user)
    favs = []
    user.favorites.each { |a| favs << a.hotel_id }
    Hotel.where(id: favs)
  end

end
