class User < ApplicationRecord
  # Avatar handling
  mount_uploader :avatar_file, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :lockable, :timeoutable
  validates :email, format: { with: Devise.email_regexp }
end
