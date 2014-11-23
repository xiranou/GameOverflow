require 'rails_helper'

describe Game do
  describe "testing Game validations" do
    it {should validate_presence_of(:title)}
    it {should belong_to(:genre)}
    it {should belong_to(:console)}
  end
end