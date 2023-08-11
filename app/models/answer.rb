class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :max_answer_count

  scope :correct, -> { where(correct: true) }

  private

  def max_answer_count
    errors.add("can't have more than 4 answers") if question
  end
end
