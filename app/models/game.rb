class Game < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :console
  belongs_to :genre

  has_many :topics, as: :discussable
  has_many :articles, through: :topics
end