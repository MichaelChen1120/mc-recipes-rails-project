class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  RATING = (1..5).to_a
end
