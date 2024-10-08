class User < ApplicationRecord
  mount_uploader :image_url, ImageUploader
    has_secure_password
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
  validates :image_url, presence: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end
