require 'rails_helper'

describe Article do
  it "has a title and content." do
    article = create(:article)
    expect(article).to be_valid
  end
  it "should be invalid if it does not have a title."
  it "should be invalid if it does not have content."
end
