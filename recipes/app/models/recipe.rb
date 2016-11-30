class Recipe < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
end
