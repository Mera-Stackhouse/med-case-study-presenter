class Category < ApplicationRecord

  has_many :cases_categories
  has_many :cases, through: :cases_categories

end
