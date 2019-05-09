class Case < ApplicationRecord

  has_many :cases_categories
  has_many :categories, through: :cases_categories

  scope :alphabetical, -> { order(title: :asc, id: :asc) }
  default_scope {alphabetical}

  validates :title, presence: true, length: {in: 1..40}, uniqueness: true
  validates :body, presence: true, length: {in: 3..500}

end
