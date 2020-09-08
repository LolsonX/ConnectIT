# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "validations" do
    subject { Tag.create(name: "Example name") }
    it { should validate_uniqueness_of(:name) }
  end
end
