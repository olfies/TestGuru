module QuestionsHelper

  def question_header(question)
    if question.new_record?
       "Edit #{ @question.test.title } Question"
    else
       "Create New #{ @question.test.title } Question"
    end
  end

end
