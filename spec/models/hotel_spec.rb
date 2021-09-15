require 'rails_helper'

RSpec.describe Hotel, type: :model do
  # Association test
  it { should belong_to(:user) }
  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:image_url) }

end
