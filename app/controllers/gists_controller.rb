class GistsController < ApplicationController
    before_action :authenticate_user!

    def gist
        service = GistQuestionService.new(@test_passage.current_question);
        result = service.call

        flash_options = if service.success?
          current_user.gists.create(
            question: @test_passage.current_question, url: result.html_url)

          {notice: t('.success', url: result.html_url )}
        else
          {alert: t('.failure')}
        end

        redirect_to @test_passage, flash_options
      end
