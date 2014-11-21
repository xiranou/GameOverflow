require 'rails_helper'

describe Article do
  it "has a title and content." do
    article = create(:article)
    expect(article).to be_valid
  end
  it "should be invalid if it does not have a title." do
    article = create(:notitle_article)
    expect(article).to be_invalid
  end
  it "should be invalid if it does not have content." do
    article = create(:nocontent_article)
    expect(article).to be_invalid
  end
end
