class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password
  has_many :recipes
  has_many :comments
end
