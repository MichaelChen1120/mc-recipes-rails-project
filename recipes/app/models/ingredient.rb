class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, inverse_of: :recipe
  has_many :recipes, through: :recipe_ingredients
end
