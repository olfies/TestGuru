class User < ApplicationRecord
  has_many :user_tests
  has_many :tests, through: :user_tests

  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'

  def tests_by_level(level)
    Test.joins('JOIN user_tests ON tests.id = user_tests.test_id')
        .where("tests.level = ?",level).where("user_tests.user_id = ?", id)
  end

end
