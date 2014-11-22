require 'rails_helper'

describe Vote do
  xit { should belong_to :voter }
  xit { should validate_presence_of :voter_id }
  it { should belong_to :voteable }
  it { should validate_presence_of :voteable }
end