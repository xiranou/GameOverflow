require 'rails_helper'

describe Article do
  describe "validations" do
    it "has a title and content." do
      article = create(:article)
      expect(article).to be_valid
    end
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :author_id}
  end
  describe "associations" do
    it { should have_many(:comments)}
    it {should have_many(:votes)}
    it {should belong_to(:discussable)}

    it { should belong_to(:author).class_name("User") }
  end
end
