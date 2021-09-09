class User < ApplicationRecord
  has_secure_password
  has_many :hotels
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
