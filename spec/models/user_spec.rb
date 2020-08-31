# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject do
      User.create(email: 'example@example.com',
                  password: '$tr0NgPa5Sw0Rd',
                  description: 'My very short description',
                  website: 'http://google.com',
                  location: 'Somewhere',
                  name: 'Example')
    end

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it do
      should allow_value('example@example.com', 'email@example.com',
                         'firstname.lastname@example.com',
                         'email@subdomain.example.com',
                         'firstname+lastname@example.com',
                         'email@123.123.123.123',
                         'email@[123.123.123.123]',
                         '"email"@example.com',
                         '1234567890@example.com',
                         'email@example-one.com',
                         '_______@example.com',
                         'email@example.name',
                         'email@example.museum',
                         'email@example.co.jp',
                         'firstname-lastname@example.com').for(:email)
    end
    it do
      should_not allow_value('plainaddress',
                             '#@%^%#$@#$@#.com',
                             '@example.com',
                             'Joe Smith <email@example.com>',
                             'email.example.com',
                             'email@example@example.com',
                             'email@example.com (Joe Smith)').for(:email)
    end
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).scoped_to(:tag_num) }
    it { should validate_length_of(:description).is_at_most(140) }

  end
end
