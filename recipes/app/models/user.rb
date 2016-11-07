class User < ApplicationRecord
  has_secure_password
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
