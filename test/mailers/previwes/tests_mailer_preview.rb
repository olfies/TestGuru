class TestPassagesPreview < ActionMailer::Preview
  def completed_test_preview
    user = User.first
    test = Test.first

    if user.nil? || test.nil?
      Rails.logger.error 'Unable to fetch the User or Test for the preview'
      return
    end

    test_passage = TestPassage.new(user: user, test: test)

    TestPassagesMailer.completed_test(test_passage)
  end
end
