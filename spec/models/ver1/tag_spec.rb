require 'rails_helper'

RSpec.describe Ver1::Tag, type: :model do
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should have_many(:post_tags) }
end
