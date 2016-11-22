class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password
  has_many :recipes
  has_many :ingredients, through: :recipes
end
