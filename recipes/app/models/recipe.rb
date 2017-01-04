class Recipe < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true

  def ingredients_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.ingredients << ingredient
    end
  end

  def highest_rated

  end

end
