require 'rails_helper'

describe Comment do
  describe "testing Comment validation" do
    it { should validate_presence_of(:text) }
  end
  describe "associations" do
    it { should belong_to(:parent).class_name("Comment") }
    it { should have_many(:replies).class_name("Comment") }
    it { should have_many(:replies).dependent(:destroy) }
    it { should have_many(:votes) }

    it { should belong_to(:commenter) }
  end
end