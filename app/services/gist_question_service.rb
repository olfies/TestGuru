class GistQuestionService

    def initialize(question, client: nil)
      @question = question
      @test = @question.test
      @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    end

    def call
      @client.create_gist(gist_params)
    end

    def success?
      @client.client.last_response.status == 201
    end

    private

    def gist_params
      {
        description: "A question about #{@test.title} from TestGuru",
        files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
       }
      }
    end

    def gist_content
      content = [@question.body]
      content+= @question.answers.pluck(:body)
      content.join("\n")
    end
  end
