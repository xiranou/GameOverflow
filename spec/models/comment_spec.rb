require 'rails_helper'

describe Comment do
  describe "testing Comment validation" do
    it {should validate_presence_of(:text)}
  end
end