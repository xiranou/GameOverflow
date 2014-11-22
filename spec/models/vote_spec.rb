require 'rails_helper'

describe Vote do
  xit { should belong_to :voter }
  xit { should validate_presences_of :voter_id }
  it { should belong_to :voteable }
  it { should validate_presences_of :voteable }
end