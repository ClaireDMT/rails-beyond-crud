class Review < ApplicationRecord
  belongs_to :restaurant
  # if i have a re view, i can do review.restaurant (one instance of a restaurant)
  validates :comment, presence: true # check before .save than the comment is not empty

end
