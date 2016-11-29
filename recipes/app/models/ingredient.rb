class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  belongs_to :recipe
end
