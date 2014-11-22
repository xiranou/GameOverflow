class Article < ActiveRecord::Base
  validates_presence_of :title, :content
  belongs_to :discussable, polymorphic: true
  has_many :comments
  has_many :votes, as: :voteable
end