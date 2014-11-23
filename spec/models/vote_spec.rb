require 'rails_helper'

describe Vote do
  describe "validations" do
    it { should validate_presence_of :voter_id }
    it { should validate_presence_of :voteable }
  end
  describe "associations" do
    it { should belong_to :voter }
    it { should belong_to :voteable }
  end
end