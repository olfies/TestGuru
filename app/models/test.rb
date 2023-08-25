class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :high_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.tests_by_category(category)
    by_category(category).pluck(:title).order(title: :DESC)
  end
end
