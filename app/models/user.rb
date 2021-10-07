class User < ApplicationRecord
  has_secure_password
  has_many :hotels
  has_many :favorites

  validates :username, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }
end
