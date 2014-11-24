require 'rails_helper'

describe Topic do
  describe "association" do
    it { should belong_to(:discussable) }
    it { should belong_to(:article) }
  end
end