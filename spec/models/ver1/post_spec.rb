require 'rails_helper'

RSpec.describe Ver1::Post, type: :model do
  it { should validate_length_of(:content).is_at_most(250) }
  it { should validate_length_of(:content).is_at_least(3) }
  it { should validate_presence_of(:content) }
  it { should have_many(:post_tags) }
end
