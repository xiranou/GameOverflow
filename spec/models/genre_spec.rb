require 'rails_helper'

describe Genre do
  describe "testing Genre validations" do
    it {should validate_presence_of(:name)}
    it {should have_many(:games)}
  end
end