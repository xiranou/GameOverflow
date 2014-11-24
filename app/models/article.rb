class Article < ActiveRecord::Base
  validates_presence_of :title, :content, :author_id

  has_many :comments
  has_many :votes, as: :voteable
  belongs_to :author, class_name: "User"

  has_many :topics
  has_one :genre_topic, through: :topics, source_type: "Genre"
  has_one :game_topic, through: :topics, source_type: "Game"
  has_one :console_topic, through: :topics, source_type: "Console"

  def content_preview
  	  self.content.split("")[1..20].join.concat("...")
  end

  def self.recent
  	self.all.order('created_at DESC').limit(5)
  end

  def self.popular

  end

end