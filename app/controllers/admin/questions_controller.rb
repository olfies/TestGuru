class Admin::AdminQuestionsController < Admin::BaseController

  before_action :find_test, only: %i[new create index]
  before_action :find_admin_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_admin_question_not_found

  def show
  end

  def new
    @admin_question = @test.questions.new
  end

  def create
    @admin_question = @test.questions.new(admin_question_params)
    if @admin_question.save
      redirect_to test_admin_questions_path(@admin_question.test_id)
    else
      render :new
    end
  end

  def update
    if @admin_question.update(admin_question_params)
      redirect_to test_path(@admin_question.test)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @admin_question.destroy
    redirect_to test_admin_questions_path(@admin_question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_admin_question
    @admin_question = Question.find(params[:id])
  end

  def admin_question_params
    params.require(:admin_question).permit(:body)
  end

  def rescue_with_admin_question_not_found
    render plain: 'Admin Question not found'
  end

end
