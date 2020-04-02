class Review < ApplicationRecord
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :review, presence: true, length: { maximum: 1000 }
end
