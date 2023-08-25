require 'rails_helper'

RSpec.describe "answers/show", type: :view do
  before(:each) do
    assign(:answer, Answer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
