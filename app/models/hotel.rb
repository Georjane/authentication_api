class Hotel < ApplicationRecord
  belongs_to :user
  has_many :favourites
  
  validates_presence_of :title, :description, :image_url
  validates_uniqueness_of :title, :description, :image_url
end
