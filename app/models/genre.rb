class Genre < ActiveRecord::Base
  validates :name, presence: true

  has_many :games

  has_many :topics, as: :discussable
  has_many :articles, through: :topics
end