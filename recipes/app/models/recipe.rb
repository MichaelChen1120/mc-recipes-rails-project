class Recipe < ApplicationRecord::Base
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
