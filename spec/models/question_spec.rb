require "rails_helper"
RSpec.describe Question, type: :model do
  describe 'associations' do
    it { should belong_to(:test) }
  end
end
