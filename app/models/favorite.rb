class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :hotel

  validates_uniqueness_of :hotel, scope: :user_id,
                                  message: 'You already have it in your list of favourites'
end
