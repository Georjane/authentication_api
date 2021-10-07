FactoryBot.define do
  factory :hotel do
    title { Faker::Hotel.title }
    description { Faker::Lorem.word }
    image_url { Faker::Lorem.word }
    user { create(:user) }
  end
end
