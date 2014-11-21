require 'rails_helper'

describe Article do
  it "has a title and content." do
    article = create(:article)
    expect(article).to be_valid
  end

  it { should validate_presence_of :title }

  it { should validate_presence_of :content }
end
