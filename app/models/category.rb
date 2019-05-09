class Category < ApplicationRecord

  has_many :cases_categories
  has_many :cases, through: :cases_categories

  scope :alphabetical, -> { order(tag: :asc, id: :asc) }
  default_scope {alphabetical}

end
