class Product < ApplicationRecord
  has_many :reviews

  def review_average
    review.average(:rate).round 
  end
end
