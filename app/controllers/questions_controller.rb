class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @question = @test.questions
  end

  def show
    render plain: @question.body
  end

  def create
    new_question = @test.questions.new(question_params)
    new_question.save
    render plain: "New question was created: #{new_question.body}"
  end

  def destroy
    @question.destroy
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found'
  end
end
