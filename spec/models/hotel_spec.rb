require 'rails_helper'

RSpec.describe Hotel, type: :model do
  
  puts '-------------title'
  puts :title
  puts '----------title'
  it { should have_many(:favorites) }
  it { should belong_to(:user) }
  it {
    should validate_length_of(:title)
      .is_at_least(3)
  }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image_url) }
end
