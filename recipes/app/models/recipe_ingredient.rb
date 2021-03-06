class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient, inverse_of: :recipe_ingredients

  accepts_nested_attributes_for :ingredient
end
