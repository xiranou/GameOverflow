class Vote < ActiveRecord::Base
  validates_presence_of :voteable
  belongs_to :voteable, polymorphic: true
end