class Recipe < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_many :recipe_ingredients, inverse_of: :recipe
  has_many :ingredients, through: :recipe_ingredients
  has_many :reviews
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
  accepts_nested_attributes_for :ingredients

  def ingredient_attributes=(ingredient_attributes)
    ingredient_attributes.values.each do |ingredient_attribute|
      ingredient = Ingredient.find_or_create_by(ingredient_attribute)
      self.recipe_ingredients.ingredients << ingredient
    end
  end

  def rated?
    if self.reviews != nil
      true
    else
      false
    end
  end

  def self.highest_rated
    recipes = []
    Recipe.all.each do |recipe|
      if recipe.rated?
        recipes << recipe
      end
    end
    recipes.sort.reverse
  end

  def sorted
    self.reviews
  end

  def sort_by_rating
    sorted_reviews = []
    reviews = []
    self.reviews.each do |review|
      reviews << review.rating
    end
  end

  def average_rating
    ratings = []
    self.reviews.each do |review|
      ratings << review.rating
    end
    ratings.sum / ratings.size_to_i
  end

end
