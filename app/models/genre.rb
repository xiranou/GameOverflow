class Genre < ActiveRecord::Base
  validates :name, presence: true

  has_many :games

end