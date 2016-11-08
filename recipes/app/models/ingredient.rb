class Ingredient < ApplicationRecord::Base
  validates_presence_of :name
  has_many :recipe_ingredients
  has_many :recipes, though: :recipe_ingredients
end
