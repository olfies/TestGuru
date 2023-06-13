class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :high_level, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.get_titles(category_name)
    Test.joins(' JOIN categories ON tests.category_id = categories.id').where('categories.title = ?', category_name)
        .order(title: :desc).pluck(:title)
  end
end
