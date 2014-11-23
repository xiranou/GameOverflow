class Game < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :console
  belongs_to :genre
end