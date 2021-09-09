class Hotel < ApplicationRecord
  belongs_to :user
  has_many :favorites

  validates_presence_of :title, :description, :image_url
  validates_uniqueness_of :title, :description, :image_url
end
