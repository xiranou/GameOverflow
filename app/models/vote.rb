class Vote < ActiveRecord::Base
  validates_presence_of :voteable, :voter_id
  belongs_to :voteable, polymorphic: true
  belongs_to :voter, class_name: "User"
end