require 'rails_helper'

describe Article do
  it "has a title and content." do
    article = create(:article)
    expect(article).to be_valid
  end

  it { should validate_presence_of :title }

  it { should validate_presence_of :content }

  it { should have_many(:comments)}

  it {should have_many(:votes)}

  it {should belong_to(:discussable)}

end
