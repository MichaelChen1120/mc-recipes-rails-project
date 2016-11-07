class RecipeIngredient < ApplicationRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :user
end
