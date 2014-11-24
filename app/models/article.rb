class Article < ActiveRecord::Base
  validates_presence_of :title, :content, :author_id

  has_many :comments
  has_many :votes, as: :voteable
  belongs_to :author, class_name: "User"

  belongs_to :genre
  belongs_to :game
  belongs_to :console
end