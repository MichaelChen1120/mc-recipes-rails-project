class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
end
