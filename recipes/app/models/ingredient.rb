class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, though: :recipe_ingredients
end
