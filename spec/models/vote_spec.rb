require 'rails_helper'

describe Vote do
  it { should belong_to :voter }
  it { should validate_presences_of :voter_id }
  it { should belong_to :voteable }
end