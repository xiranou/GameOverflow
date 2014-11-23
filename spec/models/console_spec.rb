require 'rails_helper'

describe Console do
  describe "testing Console validations" do
    it {should validate_presence_of(:name)}
    it {should have_many(:games)}
  end
end