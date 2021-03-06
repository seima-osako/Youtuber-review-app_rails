class User < ApplicationRecord
  has_many :reviews
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader

  validates :nickname, presence: true
end
