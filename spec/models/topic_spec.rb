require 'rails_helper'

describe Topic do
  describe "association" do
    it { should belong_to(:discussable) }
  end
end