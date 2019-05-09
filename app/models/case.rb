class Case < ApplicationRecord

  has_many :cases_categories
  has_many :categories, through: :cases_categories

  scope :alphabetical, -> { order(title: :asc, id: :asc) }
  default_scope {alphabetical}

end
