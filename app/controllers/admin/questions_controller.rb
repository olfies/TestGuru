class Admin::AdminQuestionsController < Admin::BaseController

  before_action :find_test, only: %i[new create index]
  before_action :find_admin_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_admin_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(admin_question_params)
    if @question.save
      redirect_to admin_questions_path(@question.test_id)
    else
      render :new
    end
  end

  def update
    if @question.update(admin_question_params)
      redirect_to test_path(@question.test)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path(@question.test_id)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_admin_question
    @question = Question.find(params[:id])
  end

  def admin_question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_admin_question_not_found
    render plain: 'Admin Question not found'
  end

end
