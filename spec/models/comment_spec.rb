require 'rails_helper'

describe Comment do
  describe "testing Comment validation" do
    it {should validate_presence_of(:text)}
    it {should belong_to(:parent).class_name("Comment")}
    it {should has_many(:replies).dependent(:destroy)}
  end
end