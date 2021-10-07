class Hotel < ApplicationRecord
  belongs_to :user
  has_many :favorites
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :image_url, presence: true
  validates_uniqueness_of :title, :description, :image_url
end
