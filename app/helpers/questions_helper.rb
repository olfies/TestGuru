module QuestionsHelper

  def question_header(question)
    if question
       "Create New #{@test.title} Question"
    else
       "Edit #{question.test.title} Question"
    end
  end

end
