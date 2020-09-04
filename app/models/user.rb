class User < ApplicationRecord
  # Avatar handling
  mount_uploader :avatar_file, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :trackable, :lockable, :timeoutable,
    :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Denylist
  validates :email, format: {with: Devise.email_regexp}
  # noinspection RailsParamDefResolve
  validates_confirmation_of :password
end
