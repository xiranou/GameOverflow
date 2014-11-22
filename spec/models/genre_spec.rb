require 'rails_helper'

describe Game do
  describe "testing Game validations"
    it {should validate_presence_of(:name)}
    it {should have_many(:games)}
  end
end