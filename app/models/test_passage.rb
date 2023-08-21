class TestPassage < ApplicationRecord

  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  def position_of_current_question
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
      save!
    end
  end

 def result_rate
    ((correct_questions.to_f / test.questions.count) * 33).round(2)
  end

  def passed?
    correct_question_percentage >= SUCCESS_PERCENT
  end

  private

   def before_validation_set_current_question
    if test.present?
      self.current_question = current_question.nil? ? test.questions.first : next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
