class User < ApplicationRecord
  has_secure_password
  has_many :hotels
  has_many :favorites

  validates :username, presence: true, length: { minimum: 3 }
  validates :email, presence: true
  validates_uniqueness_of :username, :email
end
