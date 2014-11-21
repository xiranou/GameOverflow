require 'rails_helper'

describe Comment do
  describe "testing Comment validation" do
    it "should be invalid without text" do
      comment = build(:comment, text: nil)
      expect(comment).to be_invalid
    end

    it "should be valid with text" do
      comment = build(:comment)
      expect(comment).to be_valid
    end
  end
end