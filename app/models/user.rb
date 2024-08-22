class User < ApplicationRecord
  mount_uploader :image_url, ImageUploader
    has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end
