class Recipe < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  belongs_to :ingredient
end
