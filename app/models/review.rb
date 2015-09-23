class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :restaurant_id, presence: true
  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: [0,1,2,3,4,5], message: "Please enter an integer from 0 to 5" }
end
