require 'rails_helper'

RSpec.describe Ver1::PostTag, type: :model do
  it { should belongs_to :post }
  it { should belongs_to :tag }
end
