require 'rails_helper'

describe Comment do
  describe "testing Comment validation" do
    it {should validate_presence_of(:text)}
    it {should belong_to(:parent).class_name("Comment")}
    it {should have_many(:replies).class_name("Comment")}
    it {should have_many(:replies).dependent(:destroy)}
    it { should have_many(:votes) }
  end
end