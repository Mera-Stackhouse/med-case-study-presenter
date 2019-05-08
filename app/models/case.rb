class Case < ApplicationRecord

  has_many :cases_categories
  has_many :categories, through: :cases_categories
end
