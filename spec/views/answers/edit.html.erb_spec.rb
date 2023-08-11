require 'rails_helper'

RSpec.describe "answers/edit", type: :view do
  let(:answer) {
    Answer.create!()
  }

  before(:each) do
    assign(:answer, answer)
  end

  it "renders the edit answer form" do
    render

    assert_select "form[action=?][method=?]", answer_path(answer), "post" do
    end
  end
end
