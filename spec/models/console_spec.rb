require 'rails_helper'

describe Console do
  describe "testing Console validations"
    it {should validate_presence_of(:name)}
    it {should have_many(:games)}
  end
end