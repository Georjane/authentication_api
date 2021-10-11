class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  validates_uniqueness_of :hotel, scope: :user_id
end
